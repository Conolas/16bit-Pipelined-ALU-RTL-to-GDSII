# Physical Design

This folder contains physical implementation files generated using Cadence Innovus.

## Files

| File | Description |
|---|---|
| innovus.tcl | Innovus physical design script |
| final_ALU.enc | Innovus database |
| final_ALU.v | Routed gate-level netlist |
| final_ALU.gds | Final GDSII layout |

## Physical Design Flow

1. Load synthesized netlist
2. Load LEF/LIB technology files
3. Floorplanning
4. Placement
5. Clock Tree Synthesis (CTS)
6. Routing
7. GDSII stream-out

## Technology Files Used

### LEF Files

- gsclib045_tech.lef
- gsclib045_macro.lef

### Liberty File

- slow.lib

## Results

Successfully completed:

- placement
- routing
- metal interconnect generation
- GDSII generation

## Notes

The implementation flow used a simplified academic backend setup with partial timing constraint configuration.
