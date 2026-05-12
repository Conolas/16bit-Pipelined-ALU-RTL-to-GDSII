create_library_set -name slow_lib \
-timing {
 /opt/cadence/FOUNDRY/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_svt_v4.4/gsclib045/timing/slow_vdd1v0_basicCells.lib
}

create_rc_corner -name typical_rc

create_delay_corner -name delay_default \
-library_set slow_lib \
-rc_corner typical_rc

create_constraint_mode -name constraints \
-sdc_files {Constraints/constraint.sdc}

create_analysis_view -name setup_view \
-constraint_mode constraints \
-delay_corner delay_default

create_analysis_view -name hold_view \
-constraint_mode constraints \
-delay_corner delay_default

set_analysis_view \
-setup {setup_view} \
-hold {hold_view}
