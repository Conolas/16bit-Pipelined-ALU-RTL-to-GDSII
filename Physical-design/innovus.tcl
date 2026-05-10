# =========================================
# LEF Files
# =========================================

set init_lef_file {
    /opt/cadence/FOUNDRY/digital/45nm/dig/lef/gsclib045_tech.lef
    /opt/cadence/FOUNDRY/digital/45nm/dig/lef/gsclib045_macro.lef
}

# =========================================
# LIB File
# =========================================

set init_lib_file {
    /opt/cadence/CONFRML211/share/cfm/lec/demo/rcv_intro/libs/gsclib045_v3.5/timing/slow.lib
}

# =========================================
# Verilog Netlist
# =========================================

set init_verilog ALU_16_synth.v

# =========================================
# Top Module
# =========================================

set init_top_cell ALU

# =========================================
# SDC Constraints
# =========================================

set init_sdc_file ALU.sdc

# =========================================
# Initialize Design
# =========================================

init_design

# =========================================
# Floorplan
# =========================================

floorPlan -site CoreSite -r 1.0 0.7 20 20 20 20

# =========================================
# Placement
# =========================================

place_design

# =========================================
# Clock Tree
# =========================================

ccopt_design

# =========================================
# Routing
# =========================================

route_design

# =========================================
# Reports
# =========================================

report_area > innovus_area.rpt
report_timing > innovus_timing.rpt

# =========================================
# Save Design
# =========================================

saveDesign ALU_innovus.enc
