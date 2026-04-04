//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
//Date        : Sat Apr  4 14:37:30 2026
//Host        : Justin-T480 running 64-bit major release  (build 9200)
//Command     : generate_target CPU.bd
//Design      : CPU
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "CPU,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=CPU,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=27,numReposBlks=27,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=21,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "CPU.hwdef" *) 
module CPU
   (ALURes,
    clk,
    reset);
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ALURES DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ALURES, LAYERED_METADATA undef" *) output [15:0]ALURes;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET reset, CLK_DOMAIN CPU_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input reset;

  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [3:0]ALUControl_0_ALUControl;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [15:0]ALU_0_ALUResult;
  wire ALU_zero;
  wire ANDGate_0_C;
  wire [1:0]ControlUnit_0_ALUOp;
  wire ControlUnit_0_ALUSrc;
  wire ControlUnit_0_Branch;
  wire ControlUnit_0_Jump;
  wire ControlUnit_0_MemRead;
  wire ControlUnit_0_MemWrite;
  wire ControlUnit_0_RegDst;
  wire ControlUnit_0_RegWrite;
  wire ControlUnit_BNE;
  wire ControlUnit_MemtoReg;
  wire [15:0]DataMemory_1_read_data;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [15:0]InstructMem_0_Instruction;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [11:0]JumpSlice_Dout;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [15:0]Jump_out;
  wire [15:0]Jumpadder_pc_branch;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [15:0]Multiplexer_1_out;
  wire [15:0]Multiplexer_2_out;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [15:0]PCAdder_0_pc_next;
  wire [15:0]PCAdder_1_pc_branch;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [15:0]PCRegister_0_pc_out;
  wire [15:0]PCSrc_out;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [3:0]ReadReg1_Dout;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [15:0]RegisterFile_0_read_data1;
  wire [15:0]RegisterFile_0_read_data2;
  wire [15:0]ShiftLeft1_0_out;
  wire [15:0]ShiftLeft2v2_0_out;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [15:0]SignExt11Jump_0_result;
  wire [15:0]SignExt_0_result;
  wire XORGate_0_out;
  wire clk;
  wire [3:0]fourbitMux_0_out;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [15:0]pc_branch;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [15:0]pc_next;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [15:0]pc_next_1;
  wire reset;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [3:0]xlslice_0_Dout;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [3:0]xlslice_0_Dout2;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [3:0]xlslice_2_Dout;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [3:0]xlslice_3_Dout;

  assign ALURes[15:0] = ALU_0_ALUResult;
  CPU_PCAdder_1_0 ADD2
       (.imm_shifted(ShiftLeft2v2_0_out),
        .pc_branch(PCAdder_1_pc_branch),
        .pc_in(PCAdder_0_pc_next),
        .pc_next(pc_next));
  CPU_ALU_0_0 ALU
       (.ALUControl(ALUControl_0_ALUControl),
        .ALUResult(ALU_0_ALUResult),
        .ReadData1(RegisterFile_0_read_data1),
        .ReadData2(Multiplexer_1_out),
        .zero(ALU_zero));
  CPU_ALUControl_0_1 ALUControl_0
       (.ALUControl(ALUControl_0_ALUControl),
        .ALUOp(ControlUnit_0_ALUOp),
        .Instruction(xlslice_0_Dout2));
  CPU_Multiplexer_1_0 ALUSrc
       (.input0(RegisterFile_0_read_data2),
        .input1(SignExt_0_result),
        .result(Multiplexer_1_out),
        .sel(ControlUnit_0_ALUSrc));
  CPU_ANDGate_0_0 ANDGate
       (.A(ControlUnit_0_Branch),
        .B(XORGate_0_out),
        .C(ANDGate_0_C));
  CPU_PCAdder_0_0 AddertoPC
       (.imm_shifted(ShiftLeft2v2_0_out),
        .pc_branch(pc_branch),
        .pc_in(PCRegister_0_pc_out),
        .pc_next(PCAdder_0_pc_next));
  CPU_xlslice_0_1 CU
       (.Din(InstructMem_0_Instruction),
        .Dout(xlslice_0_Dout));
  CPU_ControlUnit_0_0 ControlUnit
       (.ALUOp(ControlUnit_0_ALUOp),
        .ALUSrc(ControlUnit_0_ALUSrc),
        .BNE(ControlUnit_BNE),
        .Branch(ControlUnit_0_Branch),
        .Instruction(xlslice_0_Dout),
        .Jump(ControlUnit_0_Jump),
        .MemRead(ControlUnit_0_MemRead),
        .MemWrite(ControlUnit_0_MemWrite),
        .MemtoReg(ControlUnit_MemtoReg),
        .RegDst(ControlUnit_0_RegDst),
        .RegWrite(ControlUnit_0_RegWrite));
  CPU_DataMemory_1_0 DataMemory
       (.address(ALU_0_ALUResult),
        .clk(clk),
        .mem_read(ControlUnit_0_MemRead),
        .mem_write(ControlUnit_0_MemWrite),
        .read_data(DataMemory_1_read_data),
        .write_data(RegisterFile_0_read_data2));
  CPU_xlslice_0_4 FunctionBits
       (.Din(InstructMem_0_Instruction),
        .Dout(xlslice_0_Dout2));
  CPU_InstructMem_0_0 InstructMemory
       (.Address(PCRegister_0_pc_out),
        .Instruction(InstructMem_0_Instruction),
        .clk(clk));
  CPU_Multiplexer_3_1 Jump
       (.input0(PCSrc_out),
        .input1(Jumpadder_pc_branch),
        .result(Jump_out),
        .sel(ControlUnit_0_Jump));
  CPU_xlslice_0_5 JumpSlice
       (.Din(InstructMem_0_Instruction),
        .Dout(JumpSlice_Dout));
  CPU_PCAdder_0_1 Jumpadder
       (.imm_shifted(ShiftLeft1_0_out),
        .pc_branch(Jumpadder_pc_branch),
        .pc_in(PCRegister_0_pc_out),
        .pc_next(pc_next_1));
  CPU_Multiplexer_2_0 MemtoReg
       (.input0(ALU_0_ALUResult),
        .input1(DataMemory_1_read_data),
        .result(Multiplexer_2_out),
        .sel(ControlUnit_MemtoReg));
  CPU_PCRegister_0_0 PC
       (.clk(clk),
        .pc_in(Jump_out),
        .pc_out(PCRegister_0_pc_out),
        .reset(reset));
  CPU_Multiplexer_3_0 PCSrc
       (.input0(PCAdder_0_pc_next),
        .input1(PCAdder_1_pc_branch),
        .result(PCSrc_out),
        .sel(ANDGate_0_C));
  CPU_xlslice_2_0 ReadReg1
       (.Din(InstructMem_0_Instruction),
        .Dout(xlslice_2_Dout));
  CPU_xlslice_1_0 ReadReg2
       (.Din(InstructMem_0_Instruction),
        .Dout(ReadReg1_Dout));
  CPU_fourbitMux_0_0 RegDst
       (.input0(ReadReg1_Dout),
        .input1(xlslice_0_Dout2),
        .result(fourbitMux_0_out),
        .sel(ControlUnit_0_RegDst));
  CPU_RegisterFile_0_0 RegisterFile
       (.clk(clk),
        .read_data1(RegisterFile_0_read_data1),
        .read_data2(RegisterFile_0_read_data2),
        .read_reg1(xlslice_2_Dout),
        .read_reg2(ReadReg1_Dout),
        .reg_write(ControlUnit_0_RegWrite),
        .write_data(Multiplexer_2_out),
        .write_reg(fourbitMux_0_out));
  CPU_ShiftLeft1_0_0 ShiftLeft1_0
       (.result(ShiftLeft1_0_out),
        .s_in(SignExt11Jump_0_result));
  CPU_ShiftLeft2v2_0_0 ShiftLeft2
       (.result(ShiftLeft2v2_0_out),
        .s_in(SignExt_0_result));
  CPU_SignExt11Jump_0_0 SignExt11Jump_0
       (.imm_value(JumpSlice_Dout),
        .result(SignExt11Jump_0_result));
  CPU_SignExt_0_0 SignExtension
       (.imm_value(xlslice_3_Dout),
        .result(SignExt_0_result));
  CPU_xlslice_3_0 SignExtensionSlice
       (.Din(InstructMem_0_Instruction),
        .Dout(xlslice_3_Dout));
  CPU_XORGate_0_0 XORGate_0
       (.A(ControlUnit_BNE),
        .B(ALU_zero),
        .result(XORGate_0_out));
endmodule
