# 8-Bit RISC Processor in Verilog HDL

## Overview

This project implements an 8-bit single-cycle RISC processor using Verilog HDL. The processor was designed from the ground up to demonstrate fundamental computer architecture concepts including instruction execution, control-path generation, datapath design, memory interfacing, and program control flow.

The processor supports arithmetic, logical, memory, and control-flow instructions through a custom instruction set architecture (ISA).


## Features

* 8-bit processor architecture
* Custom instruction set
* Arithmetic Logic Unit (ALU)
* Register File (4 × 8-bit registers)
* Program Counter (PC)
* Instruction Memory
* Data Memory
* Instruction Decoder
* Control Unit
* Write-Back Stage
* Jump Instruction Support


## Processor Architecture

Instruction Memory,
Program Counter,
Decoder,
Control Unit,
Register File,
ALU,
Write Back,
Data Memory,


## Instruction Format

[7:4] Opcode

[3:2] Destination Register (Rd)

[1:0] Source Register (Rs)

Example:

0000 01 10

ADD R1, R2



## Components Implemented

### ALU

Supports:

* Addition
* Subtraction
* Bitwise AND
* Bitwise OR

### Register File

* Four 8-bit registers
* Two read ports
* One write port

### Program Counter

* Sequential instruction execution
* Jump support

### Instruction Memory

* Stores processor instructions

### Data Memory

* Supports LOAD and STORE operations

### Decoder

* Extracts opcode and register fields

### Control Unit

Generates:

* ALU control signals
* Register write enable
* Memory read enable
* Memory write enable



## Verification

All modules were verified using Verilog testbenches and simulated on EDA Playground.

Verified operations include:

* Arithmetic execution
* Register updates
* Instruction decoding
* Memory read/write
* Jump execution
* Complete Fetch → Decode → Execute → Write-Back cycle



## Tools Used

* Verilog HDL
* EDA Playground



Designed and implemented as a Computer Architecture and Digital Design project using Verilog HDL.
