# platform bin_mmult_hw
set debug_level 0
set kernels {}
set connections {}
set memories {}
set pipes {}
set profiling {}
lappend kernels [dict create \
  NAME        mmult_1 \
  VLNV        xilinx.com:hls:mmult:1.0 \
  MASTER      {M_AXI_GMEM} \
  SLAVE       S_AXI_CONTROL \
  CLK         ap_clk \
  RST         ap_rst_n \
  ADDR_OFFSET 0x00000000 \
  ADDR_RANGE  0x1000 \
  CONFIG      {} \
  DEBUG       $debug_level \
  ];
lappend connections [dict create  \
  SRC_TYPE kernel \
  SRC_NAME mmult_1 \
  SRC_PORT M_AXI_GMEM \
  DST_TYPE core \
  DST_NAME OCL_REGION_0 \
  DST_PORT M00_AXI \
  ];
lappend connections [dict create  \
  SRC_TYPE core \
  SRC_NAME OCL_REGION_0 \
  SRC_PORT S_AXI \
  DST_TYPE kernel \
  DST_NAME mmult_1 \
  DST_PORT S_AXI_CONTROL \
  ];
set kernel_resources [dict create CONNECTIONS $connections MEMORIES $memories PIPES $pipes PROFILING $profiling]
