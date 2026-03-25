# CSE 490/590: 16-bit Processor Design
**Spring 2026 - Project 1**

## Team Members
* **Justin Downer** - UBIT: `jrdowner`
* **Sajjad Ali** - UBIT: `sali22`
* **Vishal Kishore Kumar** - UBIT: `vishalki`

## Project Overview
This project involves the design, simulation, and synthesis of a simple, single-cycle, non-pipelined 16-bit processor. The design is implemented using **Verilog HDL** and targeted for the **Xilinx Basys 3 FPGA** board via the **Xilinx Vivado** development environment.

### Processor Specifications
* **Word Size**: 16 bits.
* **Addressing**: Byte-addressed memory (8 bits).
* **Architecture**: Non-pipelined, single-cycle design.
* **Registers**: 16 general-purpose registers ($s0$ through $s15$), each 16 bits wide.
* **Memory Size**: Minimum 64 memory locations for both Instruction and Data memory.

---

## Repository Structure
As required by the course documentation, this repository maintains the following structure:

* **`/SourceCode`**: Subdirectory containing all implementation code.
* **`/ProjectReport`**: Contains the code checkpoint report and will house the final project report.
* **`WorkDivision`**: Documentation of agreed-upon division of work and contribution pledges.
* **`WeeklyLog`**: Chronological record of meeting details and individual work progress.

---

## Mandatory Instructions
The following 10 instructions MUST be implemented for evaluation:

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
The design must include the following mandatory blocks:
* **Program Counter (PC)**
* **Instruction Memory**
* **Data Memory**
* **Register File**
* **ALU (Arithmetic Logic Unit)**
* **Control Unit(s)**
* **Sign Extension**
* **Multiplexer(s)**

---

## Deliverables & Deadlines
| Task | Due Date | Points |
| :--- | :--- | :--- |
| **Group Registration** | Feb 28, 2026 | 5 |
| **Code Checkpoint** | March 14, 2026 | 10 |
| **Final Code & Report** | April 4, 2026 | 50 |
| **Live Interview/Demo** | April 8, 2026 (TBA) | 20 |

---

## Tools & Resources
* **Xilinx Vivado**: Integrated development environment for HDL synthesis and simulation.
* **Basys 3 FPGA**: Target hardware platform.
* **Verilog HDL**: Hardware Description Language used for structure and behavior.

---

## Work Contribution Summary
*This section provides a transparent record of individual contributions as evidenced by the GitHub commit history and project logs*

### Justin Downer (Lead Architect & Systems Integrator)
* **Core Architecture**: Designed and implemented the behavioral Verilog for the ALU, Control Unit, and Register File.
* **Code Refactoring**: Audited and refactored all externally submitted logic modules to resolve synthesis errors and ensure compatibility with the 16-bit datapath.
* **Structural Integration**: Developed the top-level structural design using Vivado Block Designer and managed the automated HDL wrapper for the full system.
* **Control Logic**: Engineered the PC-increment logic (+2), XOR/AND branch selection mechanism, and J-type jump address calculation.
* **Verification**: Successfully generated the bitstream, mapped the ALUResult to the 7-segment display, and conducted all functional hardware testing.

### Sajjad Ali
* **Initial Module Drafts**: Provided early drafts for supplementary logic modules (Refactored by Lead Architect for functional integration).

### Vishal Kishore Kumar
* **Initial Module Drafts**: Provided early drafts for supplementary logic modules (Refactored by Lead Architect for functional integration).
