############################################################
# CADENCE INNOVUS AUTOMATED BACKEND FLOW
############################################################

puts "==========================================="
puts "STARTING INNOVUS BACKEND FLOW"
puts "==========================================="

############################################################
# DESIGN VARIABLES
############################################################

set TOP_MODULE ALU

############################################################
# INIT DESIGN
############################################################

set init_verilog "Synthesis/ALU_synth.v"

set init_top_cell $TOP_MODULE

set init_lef_file {
    /opt/cadence/FOUNDRY/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_svt_v4.4/gsclib045/lef/gsclib045_tech.lef
    /opt/cadence/FOUNDRY/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_svt_v4.4/gsclib045/lef/gsclib045_macro.lef
}

set init_mmmc_file "Scripts/mmmc.tcl"

init_design

############################################################
# SAVE INIT CHECKPOINT
############################################################

saveDesign init_design.enc

############################################################
# FLOORPLAN
############################################################

floorPlan -site CoreSite -r 1.0 0.7 20 20 20 20

createRow -site CoreSite

createRow -site CoreSiteDouble

saveDesign floorplan.enc

############################################################
# PIN PLACEMENT
############################################################

setPinAssignMode -pinEditInBatch true

editPin -side LEFT \
-layer Metal3 \
-spreadType CENTER \
-pin {A[0] A[1] A[2] A[3] A[4] A[5] A[6] A[7] \
A[8] A[9] A[10] A[11] A[12] A[13] A[14] A[15]}

editPin -side RIGHT \
-layer Metal3 \
-spreadType CENTER \
-pin {B[0] B[1] B[2] B[3] B[4] B[5] B[6] B[7] \
B[8] B[9] B[10] B[11] B[12] B[13] B[14] B[15]}

editPin -side TOP \
-layer Metal3 \
-spreadType CENTER \
-pin {clk rst opcode[0] opcode[1] opcode[2] opcode[3]}

editPin -side BOTTOM \
-layer Metal3 \
-spreadType CENTER \
-pin {result[0] result[1] result[2] result[3] \
result[4] result[5] result[6] result[7] \
result[8] result[9] result[10] result[11] \
result[12] result[13] result[14] result[15] \
carry overflow zero negative valid_out}

setPinAssignMode -pinEditInBatch false

############################################################
# PLACEMENT
############################################################

place_design

optDesign -preCTS

saveDesign placement.enc

############################################################
# CLOCK TREE SYNTHESIS
############################################################

create_ccopt_clock_tree_spec

ccopt_design

saveDesign cts.enc

############################################################
# POWER DELIVERY NETWORK
############################################################

puts "==========================================="
puts "Creating PDN..."
puts "==========================================="

############################################################
# CREATE POWER NETS
############################################################

addNet VDD -power
addNet VSS -ground

globalNetConnect VDD -type pgpin -pin VDD -inst *
globalNetConnect VSS -type pgpin -pin VSS -inst *

applyGlobalNets

############################################################
# CREATE POWER RINGS
############################################################

addRing \
-type core_rings \
-nets {VDD VSS} \
-follow core \
-layer {top Metal6 bottom Metal6 left Metal5 right Metal5} \
-width 2 \
-spacing 1 \
-offset 2

############################################################
# CREATE POWER STRIPES
############################################################

addStripe \
-nets {VDD VSS} \
-layer Metal4 \
-direction vertical \
-width 1 \
-spacing 1 \
-set_to_set_distance 20 \
-start_offset 10

############################################################
# SPECIAL ROUTE POWER
############################################################

sroute

############################################################
# SAVE PDN CHECKPOINT
############################################################

saveDesign pdn_complete.enc

############################################################
# SIGNAL ROUTING
############################################################

puts "==========================================="
puts "Starting Routing..."
puts "==========================================="

############################################################
# ROUTING
############################################################

refinePlace

routeDesign

setAnalysisMode -analysisType onChipVariation

optDesign -postRoute

saveDesign final_postroute.enc

############################################################
# FINAL VERIFICATION
############################################################

verify_drc

verifyConnectivity -type all

############################################################
# FINAL EXPORTS
############################################################

streamOut final_ALU.gds

rcOut -spef final_ALU.spef

saveNetlist final_ALU.v

saveDesign final_clean.enc
