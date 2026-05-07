# RTL Design

This folder contains the Verilog RTL implementation of the 16-bit pipelined ALU along with its verification testbench.

## Files

| File | Description |
|---|---|
| ALU.v | Main RTL design |
| tb_ALU.v | Testbench for functional verification |

## Features

- 16-bit datapath
- 2-stage pipeline architecture
- Arithmetic operations
- Logical operations
- Comparison operations
- Overflow handling
- Valid signal propagation

## Supported Operations

| Opcode | Operation |
|---|---|
| 0 | ADD |
| 1 | SUB |
| 2 | MUL |
| 3 | DIV |
| 4 | AND |
| 5 | OR |
| 6 | XOR |
| 7 | NOT |
| 8 | Shift Left |
| 9 | Shift Right |
| 10 | Compare Equal |
| 11 | Compare Greater |

## Verification

The testbench verifies:

- arithmetic correctness
- overflow conditions
- divide-by-zero handling
- flag generation
- pipeline latency
