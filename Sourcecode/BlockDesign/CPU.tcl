
################################################################
# This is a generated script based on design: CPU
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2025.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   if { [string compare $scripts_vivado_version $current_vivado_version] > 0 } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2042 -severity "ERROR" " This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Sourcing the script failed since it was created with a future version of Vivado."}

   } else {
     catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   }

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source CPU_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# ALU, ControlUnit, PCRegister, InstructMem, SignExt, RegisterFile, Multiplexer, DataMemory, Multiplexer, PCAdder, ANDGate, Multiplexer, PCAdder, ShiftLeft2v2, Multiplexer, XORGate, fourbitMux, ALUControl, ShiftLeft1, SignExt11Jump, PCAdder

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35tcpg236-1
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name CPU

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:xlslice:1.0\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

##################################################################
# CHECK Modules
##################################################################
set bCheckModules 1
if { $bCheckModules == 1 } {
   set list_check_mods "\ 
ALU\
ControlUnit\
PCRegister\
InstructMem\
SignExt\
RegisterFile\
Multiplexer\
DataMemory\
Multiplexer\
PCAdder\
ANDGate\
Multiplexer\
PCAdder\
ShiftLeft2v2\
Multiplexer\
XORGate\
fourbitMux\
ALUControl\
ShiftLeft1\
SignExt11Jump\
PCAdder\
"

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set clk [ create_bd_port -dir I -type clk -freq_hz 100000000 clk ]
  set reset [ create_bd_port -dir I -type rst reset ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $reset
  set ALURes [ create_bd_port -dir O -from 15 -to 0 -type data ALURes ]

  # Create instance: ALU, and set properties
  set block_name ALU
  set block_cell_name ALU
  if { [catch {set ALU [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ALU eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ControlUnit, and set properties
  set block_name ControlUnit
  set block_cell_name ControlUnit
  if { [catch {set ControlUnit [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ControlUnit eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: PC, and set properties
  set block_name PCRegister
  set block_cell_name PC
  if { [catch {set PC [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $PC eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: InstructMemory, and set properties
  set block_name InstructMem
  set block_cell_name InstructMemory
  if { [catch {set InstructMemory [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $InstructMemory eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SignExtension, and set properties
  set block_name SignExt
  set block_cell_name SignExtension
  if { [catch {set SignExtension [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SignExtension eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: RegisterFile, and set properties
  set block_name RegisterFile
  set block_cell_name RegisterFile
  if { [catch {set RegisterFile [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $RegisterFile eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ALUSrc, and set properties
  set block_name Multiplexer
  set block_cell_name ALUSrc
  if { [catch {set ALUSrc [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ALUSrc eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: DataMemory, and set properties
  set block_name DataMemory
  set block_cell_name DataMemory
  if { [catch {set DataMemory [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $DataMemory eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: MemtoReg, and set properties
  set block_name Multiplexer
  set block_cell_name MemtoReg
  if { [catch {set MemtoReg [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $MemtoReg eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: AddertoPC, and set properties
  set block_name PCAdder
  set block_cell_name AddertoPC
  if { [catch {set AddertoPC [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $AddertoPC eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ANDGate, and set properties
  set block_name ANDGate
  set block_cell_name ANDGate
  if { [catch {set ANDGate [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ANDGate eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: PCSrc, and set properties
  set block_name Multiplexer
  set block_cell_name PCSrc
  if { [catch {set PCSrc [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $PCSrc eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ADD2, and set properties
  set block_name PCAdder
  set block_cell_name ADD2
  if { [catch {set ADD2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ADD2 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ShiftLeft2, and set properties
  set block_name ShiftLeft2v2
  set block_cell_name ShiftLeft2
  if { [catch {set ShiftLeft2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ShiftLeft2 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Jump, and set properties
  set block_name Multiplexer
  set block_cell_name Jump
  if { [catch {set Jump [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Jump eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: XORGate_0, and set properties
  set block_name XORGate
  set block_cell_name XORGate_0
  if { [catch {set XORGate_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $XORGate_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: CU, and set properties
  set CU [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 CU ]
  set_property -dict [list \
    CONFIG.DIN_FROM {15} \
    CONFIG.DIN_TO {12} \
    CONFIG.DIN_WIDTH {16} \
  ] $CU


  # Create instance: ReadReg2, and set properties
  set ReadReg2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 ReadReg2 ]
  set_property -dict [list \
    CONFIG.DIN_FROM {11} \
    CONFIG.DIN_TO {8} \
    CONFIG.DIN_WIDTH {16} \
  ] $ReadReg2


  # Create instance: ReadReg1, and set properties
  set ReadReg1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 ReadReg1 ]
  set_property -dict [list \
    CONFIG.DIN_FROM {7} \
    CONFIG.DIN_TO {4} \
    CONFIG.DIN_WIDTH {16} \
  ] $ReadReg1


  # Create instance: SignExtensionSlice, and set properties
  set SignExtensionSlice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 SignExtensionSlice ]
  set_property -dict [list \
    CONFIG.DIN_FROM {3} \
    CONFIG.DIN_WIDTH {16} \
  ] $SignExtensionSlice


  # Create instance: FunctionBits, and set properties
  set FunctionBits [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 FunctionBits ]
  set_property -dict [list \
    CONFIG.DIN_FROM {3} \
    CONFIG.DIN_WIDTH {16} \
  ] $FunctionBits


  # Create instance: RegDst, and set properties
  set block_name fourbitMux
  set block_cell_name RegDst
  if { [catch {set RegDst [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $RegDst eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ALUControl_0, and set properties
  set block_name ALUControl
  set block_cell_name ALUControl_0
  if { [catch {set ALUControl_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ALUControl_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ShiftLeft1_0, and set properties
  set block_name ShiftLeft1
  set block_cell_name ShiftLeft1_0
  if { [catch {set ShiftLeft1_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ShiftLeft1_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: JumpSlice, and set properties
  set JumpSlice [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 JumpSlice ]
  set_property -dict [list \
    CONFIG.DIN_FROM {11} \
    CONFIG.DIN_WIDTH {16} \
  ] $JumpSlice


  # Create instance: SignExt11Jump_0, and set properties
  set block_name SignExt11Jump
  set block_cell_name SignExt11Jump_0
  if { [catch {set SignExt11Jump_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SignExt11Jump_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: JumpAdder, and set properties
  set block_name PCAdder
  set block_cell_name JumpAdder
  if { [catch {set JumpAdder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $JumpAdder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net ALUControl_0_ALUControl  [get_bd_pins ALUControl_0/ALUControl] \
  [get_bd_pins ALU/ALUControl]
  connect_bd_net -net ALU_0_ALUResult  [get_bd_pins ALU/ALUResult] \
  [get_bd_pins MemtoReg/input0] \
  [get_bd_pins DataMemory/address] \
  [get_bd_ports ALURes]
  connect_bd_net -net ALU_zero  [get_bd_pins ALU/zero] \
  [get_bd_pins XORGate_0/B]
  connect_bd_net -net ANDGate_0_C  [get_bd_pins ANDGate/C] \
  [get_bd_pins PCSrc/select]
  connect_bd_net -net ControlUnit_0_ALUOp  [get_bd_pins ControlUnit/ALUOp] \
  [get_bd_pins ALUControl_0/ALUOp]
  connect_bd_net -net ControlUnit_0_ALUSrc  [get_bd_pins ControlUnit/ALUSrc] \
  [get_bd_pins ALUSrc/select]
  connect_bd_net -net ControlUnit_0_Branch  [get_bd_pins ControlUnit/Branch] \
  [get_bd_pins ANDGate/A]
  connect_bd_net -net ControlUnit_0_Jump  [get_bd_pins ControlUnit/Jump] \
  [get_bd_pins Jump/select]
  connect_bd_net -net ControlUnit_0_MemRead  [get_bd_pins ControlUnit/MemRead] \
  [get_bd_pins DataMemory/mem_read]
  connect_bd_net -net ControlUnit_0_MemWrite  [get_bd_pins ControlUnit/MemWrite] \
  [get_bd_pins DataMemory/mem_write]
  connect_bd_net -net ControlUnit_0_MemtoReg  [get_bd_pins ControlUnit/MemtoReg] \
  [get_bd_pins MemtoReg/select]
  connect_bd_net -net ControlUnit_0_RegDst  [get_bd_pins ControlUnit/RegDst] \
  [get_bd_pins RegDst/select]
  connect_bd_net -net ControlUnit_0_RegWrite  [get_bd_pins ControlUnit/RegWrite] \
  [get_bd_pins RegisterFile/reg_write]
  connect_bd_net -net ControlUnit_BNE  [get_bd_pins ControlUnit/BNE] \
  [get_bd_pins XORGate_0/A]
  connect_bd_net -net DataMemory_1_read_data  [get_bd_pins DataMemory/read_data] \
  [get_bd_pins MemtoReg/input1]
  connect_bd_net -net InstructMem_0_Instruction  [get_bd_pins InstructMemory/Instruction] \
  [get_bd_pins CU/Din] \
  [get_bd_pins ReadReg2/Din] \
  [get_bd_pins ReadReg1/Din] \
  [get_bd_pins SignExtensionSlice/Din] \
  [get_bd_pins FunctionBits/Din] \
  [get_bd_pins JumpSlice/Din]
  connect_bd_net -net JumpAdder_pc_branch  [get_bd_pins JumpAdder/pc_branch] \
  [get_bd_pins Jump/input1]
  connect_bd_net -net JumpSlice_Dout  [get_bd_pins JumpSlice/Dout] \
  [get_bd_pins SignExt11Jump_0/imm_value]
  connect_bd_net -net Jump_out  [get_bd_pins Jump/out] \
  [get_bd_pins PC/pc_in]
  connect_bd_net -net Multiplexer_1_out  [get_bd_pins ALUSrc/out] \
  [get_bd_pins ALU/ReadData2]
  connect_bd_net -net Multiplexer_2_out  [get_bd_pins MemtoReg/out] \
  [get_bd_pins RegisterFile/write_data]
  connect_bd_net -net PCAdder_0_pc_next  [get_bd_pins AddertoPC/pc_next] \
  [get_bd_pins PCSrc/input0] \
  [get_bd_pins ADD2/pc_in]
  connect_bd_net -net PCAdder_1_pc_branch  [get_bd_pins ADD2/pc_branch] \
  [get_bd_pins PCSrc/input1]
  connect_bd_net -net PCRegister_0_pc_out  [get_bd_pins PC/pc_out] \
  [get_bd_pins AddertoPC/pc_in] \
  [get_bd_pins InstructMemory/Address] \
  [get_bd_pins JumpAdder/pc_in]
  connect_bd_net -net PCSrc_out  [get_bd_pins PCSrc/out] \
  [get_bd_pins Jump/input0]
  connect_bd_net -net ReadReg1_Dout  [get_bd_pins ReadReg2/Dout] \
  [get_bd_pins RegDst/input0] \
  [get_bd_pins RegisterFile/read_reg2]
  connect_bd_net -net RegisterFile_0_read_data1  [get_bd_pins RegisterFile/read_data1] \
  [get_bd_pins ALU/ReadData1]
  connect_bd_net -net RegisterFile_0_read_data2  [get_bd_pins RegisterFile/read_data2] \
  [get_bd_pins ALUSrc/input0] \
  [get_bd_pins DataMemory/write_data]
  connect_bd_net -net ShiftLeft1_0_out  [get_bd_pins ShiftLeft1_0/out] \
  [get_bd_pins JumpAdder/imm_shifted]
  connect_bd_net -net ShiftLeft2v2_0_out  [get_bd_pins ShiftLeft2/out] \
  [get_bd_pins ADD2/imm_shifted]
  connect_bd_net -net SignExt11Jump_0_result  [get_bd_pins SignExt11Jump_0/result] \
  [get_bd_pins ShiftLeft1_0/in]
  connect_bd_net -net SignExt_0_result  [get_bd_pins SignExtension/result] \
  [get_bd_pins ShiftLeft2/in] \
  [get_bd_pins ALUSrc/input1]
  connect_bd_net -net XORGate_0_out  [get_bd_pins XORGate_0/out] \
  [get_bd_pins ANDGate/B]
  connect_bd_net -net clk_1  [get_bd_ports clk] \
  [get_bd_pins DataMemory/clk] \
  [get_bd_pins PC/clk] \
  [get_bd_pins RegisterFile/clk]
  connect_bd_net -net fourbitMux_0_out  [get_bd_pins RegDst/out] \
  [get_bd_pins RegisterFile/write_reg]
  connect_bd_net -net reset_1  [get_bd_ports reset] \
  [get_bd_pins PC/reset]
  connect_bd_net -net xlslice_0_Dout  [get_bd_pins CU/Dout] \
  [get_bd_pins ControlUnit/Instruction]
  connect_bd_net -net xlslice_0_Dout2  [get_bd_pins FunctionBits/Dout] \
  [get_bd_pins RegDst/input1] \
  [get_bd_pins ALUControl_0/Instruction]
  connect_bd_net -net xlslice_2_Dout  [get_bd_pins ReadReg1/Dout] \
  [get_bd_pins RegisterFile/read_reg1]
  connect_bd_net -net xlslice_3_Dout  [get_bd_pins SignExtensionSlice/Dout] \
  [get_bd_pins SignExtension/imm_value]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


