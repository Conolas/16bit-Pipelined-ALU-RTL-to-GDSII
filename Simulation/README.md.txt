# Simulation

This directory contains the functional verification environment for the 16-bit ALU RTL design.

The simulation stage was performed before synthesis to validate the functionality and sequential behavior of the ALU design.

---

## Objective

The purpose of simulation was to verify
- Arithmetic operations
- Logical operations
- Shift operations
- Comparison logic
- Status flag generation
- Sequential clocked behavior
- Reset functionality
- Timing relationships between signals

---

## Tool Used

- [Cadence Xcelium](httpswww.cadence.comen_UShometoolssystem-design-and-verificationsimulation-and-testbench-verificationxcelium-simulator.htmlutm_source=chatgpt.com)

---

## Files Included

 File  Description 
------
 `tb_ALU.v`  Testbench used for functional verification 
 `waveform.png`  Functional simulation waveform screenshot 
 `waveform.vcd`  Waveform dump file generated during simulation 
 `simulation.log`  Simulation execution log 

---

## Simulation Flow

```text
RTL Design
   ↓
Testbench Development
   ↓
Functional Simulation
   ↓
Waveform Verification
   ↓
Debugging and Validation