# 16-bit Pipelined ALU: Complete RTL-to-GDSII ASIC Flow using Cadence Tools

## Overview

This project demonstrates the complete RTL-to-GDSII implementation flow of a 16-bit pipelined Arithmetic Logic Unit (ALU) using industry-standard Cadence EDA tools in a 45nm technology node.

The design was developed in Verilog HDL, functionally verified through simulation, synthesized into standard-cell gates using Cadence Genus, and physically implemented using Cadence Innovus to generate the final GDSII layout.

The project focuses on providing hands-on exposure to the complete digital ASIC design flow including:

* RTL Design
* Functional Verification
* Logic Synthesis
* Area/Power Analysis
* Floorplanning
* Placement
* Clock Tree Synthesis (CTS)
* Routing
* Physical Verification
* GDSII Generation

---

# Project Highlights

* 16-bit pipelined ALU architecture
* Arithmetic and logical operation support
* 2-stage pipelined datapath
* Cadence Genus synthesis flow
* Cadence Innovus physical implementation flow
* 45nm GPDK technology implementation
* Area, timing, and power analysis
* Final routed ASIC layout generation
* GDSII stream-out completed successfully

---

# Supported ALU Operations

| Opcode | Operation       |
| ------ | --------------- |
| 0      | Addition        |
| 1      | Subtraction     |
| 2      | Multiplication  |
| 3      | Division        |
| 4      | AND             |
| 5      | OR              |
| 6      | XOR             |
| 7      | NOT             |
| 8      | Shift Left      |
| 9      | Shift Right     |
| 10     | Compare Equal   |
| 11     | Compare Greater |

---

# Architecture

## Pipeline Structure

The ALU was implemented using a 2-stage pipelined architecture.

### Stage 1

* Input operand capture
* Opcode registration
* Valid signal synchronization
* Pipeline input registers

### Stage 2

* Combinational ALU computation
* Arithmetic/logical execution
* Flag generation
* Output register stage

---

# ALU Flags

| Flag      | Description                                 |
| --------- | ------------------------------------------- |
| zero      | Result equals zero                          |
| carry     | Carry generated during arithmetic operation |
| overflow  | Signed arithmetic overflow                  |
| negative  | Result sign bit                             |
| valid_out | Output validity indicator                   |

---

# RTL Design

## RTL File

```text
RTL/ALU.v
```

## Testbench

```text
RTL/tb_ALU.v
```

The testbench validates:

* Arithmetic operations
* Logical operations
* Shift operations
* Comparison operations
* Overflow conditions
* Divide-by-zero handling
* Pipeline latency behavior

---

# Functional Verification Flow

## Simulation Environment

* Vivado Simulator
* Cadence Xcelium / NCSim

## Key Verification Goals

* Functional correctness
* Pipeline synchronization
* Correct flag generation
* Valid signal propagation
* Arithmetic overflow validation

---

# RTL-to-GDSII Flow

```text
Verilog RTL
    ↓
Functional Verification
    ↓
Cadence Xcelium Simulation
    ↓
Cadence Genus Synthesis
    ↓
Area / Power / Timing Reports
    ↓
Cadence Innovus Floorplanning
    ↓
Placement
    ↓
Clock Tree Synthesis
    ↓
Routing
    ↓
DRC / Connectivity Checks
    ↓
GDSII Stream-Out
```

---

# Technology Node

## Process Technology

45nm GPDK

## Technology Files Used

### LEF Files

* gsclib045_tech.lef
* gsclib045_macro.lef

### Timing Library

* slow.lib

---

# Cadence Genus Synthesis

## Synthesis Flow

The RTL was synthesized using Cadence Genus.

### Major Synthesis Steps

1. RTL parsing
2. Design elaboration
3. Clock constraint definition
4. Logic optimization
5. Standard-cell mapping
6. Netlist generation
7. Timing/area/power analysis

---

# Synthesis Results

| Parameter           | Value    |
| ------------------- | -------- |
| Total Cell Count    | 1100     |
| Sequential Cells    | 57       |
| Combinational Cells | 1043     |
| Total Area          | 8498.473 |
| Estimated Power     | ~2.4mW   |
| Technology Node     | 45nm     |

---

# Important Synthesis Observations

* Genus inferred optimized arithmetic structures automatically.
* CSA-tree multiplier implementations were observed in synthesized schematic.
* Multiplication logic dominated combinational area and routing complexity.
* Sequential logic count remained relatively small due to 2-stage pipelining.

---

# Physical Design using Innovus

## Physical Design Stages

### 1. Floorplanning

Defined:

* core area
* placement rows
* routing regions

### 2. Placement

Standard cells placed physically inside core.

### 3. Clock Tree Synthesis (CTS)

Clock network generation initiated for sequential elements.

### 4. Routing

Completed:

* signal routing
* via insertion
* multi-layer interconnect generation

### 5. GDSII Generation

Final routed layout exported successfully.

---

# Generated Output Files

| File          | Description                    |
| ------------- | ------------------------------ |
| ALU_synth.v   | Synthesized gate-level netlist |
| ALU.sdc       | Timing constraint file         |
| final_ALU.v   | Routed final netlist           |
| final_ALU.enc | Innovus design database        |
| final_ALU.gds | Final GDSII layout             |
| area.rpt      | Area analysis report           |
| timing.rpt    | Timing report                  |
| power.rpt     | Power analysis report          |

---

# Repository Structure

```text
16bit-Pipelined-ALU-RTL-to-GDSII/
│
├── README.md
│
├── RTL/
│   ├── ALU.v
│   └── tb_ALU.v
│
├── Synthesis/
│   ├── synth.tcl
│   ├── ALU_synth.v
│   ├── area.rpt
│   ├── timing.rpt
│   └── power.rpt
│
├── Physical_Design/
│   ├── innovus.tcl
│   ├── final_ALU.enc
│   ├── final_ALU.v
│   └── final_ALU.gds
│
├── Screenshots/
│   ├── simulation_waveform.png
│   ├── genus_schematic.png
│   ├── innovus_layout.png
│   └── gds_success.png
│
├── Reports/
│   ├── innovus_area.rpt
│   ├── innovus_timing.rpt
│   └── drc_report.txt
│
└── Documentation/
    ├── project_documentation.pdf
    ├── debugging_workthrough.pdf
    └── command_reference.pdf
```

---

# Screenshots

## RTL Simulation

Waveform verification demonstrating correct ALU functionality.

---

## Synthesized Schematic

Gate-level synthesized schematic generated by Cadence Genus.

---

## Routed Layout

Final routed physical layout generated using Cadence Innovus.

---

# Issues Encountered During Flow

## 1. SimVision Runtime Crashes

### Problem

Cadence Xcelium GUI backend crashed during waveform viewing.

### Cause

* legacy Cadence environment instability
* X11/display backend issues
* GUI runtime limitations

### Resolution

Terminal-based simulation flow used successfully.

---

## 2. Missing Physical Libraries in Innovus

### Problem

Innovus initially failed to recognize standard cells.

### Cause

LEF and LIB files were not loaded.

### Resolution

Technology LEF, macro LEF, and liberty timing files were added explicitly.

---

## 3. Incomplete Timing Constraints

### Observed Warnings

* unconstrained timing paths
* missing delay corners
* incomplete MMMC setup

### Impact

* limited timing optimization
* partial CTS limitations
* academic physical-only backend flow

---

# Learning Outcomes

This project provided practical exposure to:

* RTL design methodology
* Pipeline architecture
* ASIC synthesis flow
* Standard-cell mapping
* Power analysis
* Area analysis
* Timing analysis
* Floorplanning
* Placement and routing
* GDSII generation
* Cadence backend debugging
* Technology library integration

---

# Future Improvements

## Frontend Enhancements

* Carry Lookahead Adder (CLA)
* Wallace Tree Multiplier
* Configurable ALU width
* Low-power RTL optimization
* Better pipelining strategies

## Backend Enhancements

* Proper MMMC setup
* Full timing closure
* DRC-clean routing
* LVS verification
* STA using Cadence Tempus
* Congestion optimization
* Power optimization
* IR-drop analysis

---

# Tools Used

| Tool              | Purpose                                  |
| ----------------- | ---------------------------------------- |
| Vivado            | RTL development and initial verification |
| Xcelium / NCSim   | Functional simulation                    |
| Cadence Genus     | Logic synthesis                          |
| Cadence Innovus   | Physical design and routing              |
| Linux Environment | ASIC flow execution                      |

---

# Key Takeaways

* Successful RTL compilation and elaboration are strong indicators of RTL correctness.
* Backend implementation requires both logical and physical technology libraries.
* Multipliers heavily impact area, routing congestion, and power.
* Timing constraints are critical for proper CTS and optimization.
* Real ASIC backend debugging often involves environment and technology setup issues beyond RTL.

---

# Final Status

| Flow Stage              | Status    |
| ----------------------- | --------- |
| RTL Design              | Completed |
| Functional Verification | Completed |
| Synthesis               | Completed |
| Area/Power Analysis     | Completed |
| Floorplanning           | Completed |
| Placement               | Completed |
| Routing                 | Completed |
| GDSII Generation        | Completed |
| Timing Closure          | Partial   |
| Full DRC Closure        | Pending   |

---

# Conclusion

This project successfully demonstrates a practical RTL-to-GDSII ASIC implementation flow for a 16-bit pipelined ALU using Cadence EDA tools in 45nm technology.

The work provided end-to-end exposure to frontend and backend ASIC design methodologies, including synthesis, physical implementation, routing, and final layout generation.

The successful generation of the final GDSII file marked completion of the complete ASIC physical implementation flow.

---

# Author

Jatin

---

# License

This project is intended for educational and learning purposes.
