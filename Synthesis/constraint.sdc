# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.14-s082_1 on Thu May 07 05:50:12 EDT 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design ALU

create_clock -name clk -period 5.5 -waveform {0.0 2.75} [get_ports clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {A[15]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {A[14]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {A[13]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {A[12]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {A[11]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {A[10]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {A[9]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {A[8]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {A[7]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {A[6]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {A[5]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {A[4]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {A[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {A[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {A[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {A[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {B[15]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {B[14]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {B[13]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {B[12]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {B[11]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {B[10]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {B[9]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {B[8]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {B[7]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {B[6]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {B[5]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {B[4]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {B[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {B[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {B[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {B[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {opcode[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {opcode[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {opcode[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {opcode[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports valid_in]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {result[15]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {result[14]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {result[13]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {result[12]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {result[11]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {result[10]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {result[9]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {result[8]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {result[7]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {result[6]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {result[5]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {result[4]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {result[3]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {result[2]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {result[1]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {result[0]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports zero]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports carry]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports overflow]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports negative]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports valid_out]
set_wire_load_mode "enclosed"
