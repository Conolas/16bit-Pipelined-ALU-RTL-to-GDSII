read_libs /opt/cadence/FOUNDRY/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_svt_v4.4/gsclib045/timing/slow_vdd1v0_basicCells.lib

read_hdl RTL/ALU.v

elaborate ALU

read_sdc Constraints/constraint.sdc

check_design

check_timing_intent

syn_gen

syn_map

syn_opt

report_area > Reports/area.rpt

report_power > Reports/power.rpt

report_timing > Reports/timing.rpt

write_hdl > Synthesis/ALU_synth.v

write_db Synthesis/design_ALU.db
