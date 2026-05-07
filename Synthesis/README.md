# Logic Synthesis

This folder contains all synthesis-related files generated using Cadence Genus.

## Files

| File | Description |
|---|---|
| synth.tcl | Genus synthesis script |
| ALU_synth.v | Synthesized gate-level netlist |
| area.rpt | Area analysis report |
| timing.rpt | Timing analysis report |
| power.rpt | Power estimation report |
| ALU.sdc | Timing constraints |

## Synthesis Flow

1. Read RTL
2. Elaborate design
3. Apply clock constraints
4. Logic optimization
5. Standard-cell mapping
6. Generate reports

## Clock Constraint

Clock period:

1ns

Equivalent frequency:

1 GHz

## Key Results

| Metric | Value |
|---|---|
| Cell Count | 1100 |
| Area | 8498.473 |
| Power | ~2.4mW |

## Important Observation

Cadence Genus inferred optimized arithmetic structures including CSA-tree multiplier implementations.
