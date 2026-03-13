# CSE 490/590: 16-bit Processor Design
**Spring 2026 - Project 1**

## Team Members
* **Justin Downer** - UBIT: `jrdowner`
* **Sajjad Ali** - UBIT: `sali22`
* **Vishal Kishore Kumar** - UBIT: `vishalki`

## Project Overview
[cite_start]This project involves the design, simulation, and synthesis of a simple, single-cycle, non-pipelined 16-bit processor[cite: 7, 78]. [cite_start]The design is implemented using **Verilog HDL** and targeted for the **Xilinx Basys 3 FPGA** board via the **Xilinx Vivado** development environment[cite: 8, 22].

### Processor Specifications
* [cite_start]**Word Size**: 16 bits[cite: 79].
* [cite_start]**Addressing**: Byte-addressed memory (8 bits)[cite: 80].
* [cite_start]**Architecture**: Non-pipelined, single-cycle design[cite: 78, 80].
* [cite_start]**Registers**: 16 general-purpose registers ($s0$ through $s15$), each 16 bits wide[cite: 95].
* [cite_start]**Memory Size**: Minimum 64 memory locations for both Instruction and Data memory[cite: 97, 98].

---

## Repository Structure
[cite_start]As required by the course documentation, this repository maintains the following structure[cite: 48]:

* [cite_start]**`/SourceCode`**: Subdirectory containing all implementation code[cite: 52].
* [cite_start]**`/ProjectReport`**: Contains the code checkpoint report and will house the final project report[cite: 53].
* [cite_start]**`WorkDivision`**: Documentation of agreed-upon division of work and contribution pledges[cite: 49].
* [cite_start]**`WeeklyLog`**: Chronological record of meeting details and individual work progress[cite: 50, 51].

---

## Mandatory Instructions
[cite_start]The following 10 instructions MUST be implemented for evaluation[cite: 104, 106, 107]:

| Instruction | Type | Opcode (binary) | Function Code (binary) |
| :--- | :--- | :--- | :--- |
| **add** | R-type | `0000` | `0000` |
| **sub** | R-type | `0000` | `0001` |
| **sll** | R-type | `0000` | `0010` |
| **and** | R-type | `0000` | `0011` |
| **lw** | I-type | `0001` | N/A |
| **sw** | I-type | `0010` | N/A |
| **addi** | I-type | `0011` | N/A |
| **beq** | I-type | `0100` | N/A |
| **bne** | I-type | `0101` | N/A |
| **jmp** | J-type | `0110` | N/A |

---

## Required Components
[cite_start]The design must include the following mandatory blocks[cite: 83, 84]:
* [cite_start]**Program Counter (PC)** [cite: 92]
* [cite_start]**Instruction Memory** [cite: 85]
* [cite_start]**Data Memory** [cite: 86]
* [cite_start]**Register File** [cite: 87]
* [cite_start]**ALU (Arithmetic Logic Unit)** [cite: 88]
* [cite_start]**Control Unit(s)** [cite: 90]
* [cite_start]**Sign Extension** [cite: 89]
* [cite_start]**Multiplexer(s)** [cite: 91]

---

## Deliverables & Deadlines
| Task | Due Date | Points |
| :--- | :--- | :--- |
| **Group Registration** | [cite_start]Feb 28, 2026 [cite: 1] | [cite_start]5 [cite: 28] |
| **Code Checkpoint** | [cite_start]March 14, 2026 [cite: 1] | [cite_start]10 [cite: 29] |
| **Final Code & Report** | [cite_start]April 4, 2026 [cite: 1] | [cite_start]50 [cite: 30, 34] |
| **Live Interview/Demo** | [cite_start]April 8, 2026 (TBA) [cite: 1] | [cite_start]20 [cite: 35] |

---

## Tools & Resources
* [cite_start]**Xilinx Vivado**: Integrated development environment for HDL synthesis and simulation[cite: 10].
* [cite_start]**Basys 3 FPGA**: Target hardware platform[cite: 22].
* [cite_start]**Verilog HDL**: Hardware Description Language used for structure and behavior[cite: 9].
