# =====================================
# LOAD LIBRARY
# =====================================

read_libs /opt/cadence/FOUNDRY/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_svt_v4.4/gsclib045/timing/slow_vdd1v0_basicCells.lib

# =====================================
# READ RTL
# =====================================

read_hdl RTL/ALU.v

# =====================================
# ELABORATE
# =====================================

elaborate ALU

# =====================================
# READ CONSTRAINTS
# =====================================

read_sdc Synthesis/constraint.sdc

# =====================================
# SYNTHESIS
# =====================================

syn_gen
syn_map
syn_opt

# =====================================
# REPORTS
# =====================================

report_area > Synthesis/area.rpt

report_power > Synthesis/power.rpt

report_timing > Synthesis/timing.rpt

# =====================================
# EXPORT NETLIST
# =====================================

write_hdl > Synthesis/ALU_synth.v

# =====================================
# EXPORT DATABASE
# =====================================

write_db Synthesis/design_ALU.db
