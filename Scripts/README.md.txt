
---

# `Scripts/README.md`

```markdown
# Scripts

This directory contains TCL automation scripts used throughout the complete RTL-to-GDSII ASIC implementation flow.

The scripts automate synthesis, timing setup, floorplanning, placement, CTS, routing, PDN generation, and final physical implementation tasks.

---

## Tools Used

- [Cadence Genus](https://www.cadence.com/en_US/home/tools/digital-design-and-signoff/synthesis/genus-synthesis-solution.html?utm_source=chatgpt.com)
- [Cadence Innovus](https://www.cadence.com/en_US/home/tools/digital-design-and-signoff/soc-implementation-and-floorplanning/innovus-implementation-system.html?utm_source=chatgpt.com)

---

## Objective

The objective of these scripts was to automate:
- RTL synthesis
- Timing constraint setup
- MMMC configuration
- Floorplanning
- IO pin placement
- Standard cell placement
- Clock Tree Synthesis (CTS)
- Power Distribution Network (PDN) generation
- Detailed routing
- Timing analysis
- Final GDSII export

---

## Files Included

| File | Description |
|---|---|
| `run_genus.tcl` | RTL synthesis automation script |
| `run_innovus.tcl` | Physical design automation script |
| `constraints.sdc` | Timing and clock constraints |
| `mmmc.tcl` | MMMC configuration setup |
| `setup.tcl` | Design initialization and library setup |
| `pdn_setup.tcl` | Power ring and stripe generation script |

---

## RTL-to-GDSII Flow

```text
RTL Design
   ↓
Functional Simulation
   ↓
Logic Synthesis
   ↓
MMMC Configuration
   ↓
Floorplanning
   ↓
IO Pin Planning
   ↓
Placement
   ↓
Clock Tree Synthesis
   ↓
PDN Generation
   ↓
Detailed Routing
   ↓
DRC and Connectivity Verification
   ↓
Post-Route Timing Analysis
   ↓
Final GDSII Generation