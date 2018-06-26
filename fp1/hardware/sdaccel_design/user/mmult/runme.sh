#!/bin/sh

# 
# xocc(TM)
# runme.sh: a xocc-generated Runs Script for UNIX
# Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/software/Xilinx/SDx_2017.1/SDx/2017.1/SDK/bin:/software/Xilinx/SDx_2017.1/SDx/2017.1/bin
else
  PATH=/software/Xilinx/SDx_2017.1/SDx/2017.1/SDK/bin:/software/Xilinx/SDx_2017.1/SDx/2017.1/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/root/huaweicloud-fpga/fp1/hardware/sdaccel_design/user/mmult/src/_xocc_mmult_bin_mmult_hw.dir/impl/kernels/mmult'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado_hls -f mmult.tcl -messageDb vivado_hls.pb
