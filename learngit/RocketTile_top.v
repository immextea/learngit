`include "./rocketchip.BOOMConfig.v"
`include "./rocketchip.BOOMConfig.behav_srams.v"

module RocketTile_top(
  input   clock,
  input   reset,
  input   io_master_0_a_ready,
  output  io_master_0_a_valid,
  output [2:0] io_master_0_a_bits_opcode,
  output [2:0] io_master_0_a_bits_param,
  output [3:0] io_master_0_a_bits_size,
  output [2:0] io_master_0_a_bits_source,
  output [31:0] io_master_0_a_bits_address,
  output [15:0] io_master_0_a_bits_mask,
  output [127:0] io_master_0_a_bits_data,
  output  io_master_0_b_ready,
  input   io_master_0_b_valid,
  input  [2:0] io_master_0_b_bits_opcode,
  input  [1:0] io_master_0_b_bits_param,
  input  [3:0] io_master_0_b_bits_size,
  input  [2:0] io_master_0_b_bits_source,
  input  [31:0] io_master_0_b_bits_address,
  input  [15:0] io_master_0_b_bits_mask,
  input  [127:0] io_master_0_b_bits_data,
  input   io_master_0_c_ready,
  output  io_master_0_c_valid,
  output [2:0] io_master_0_c_bits_opcode,
  output [2:0] io_master_0_c_bits_param,
  output [3:0] io_master_0_c_bits_size,
  output [2:0] io_master_0_c_bits_source,
  output [31:0] io_master_0_c_bits_address,
  output [127:0] io_master_0_c_bits_data,
  output  io_master_0_c_bits_error,
  output  io_master_0_d_ready,
  input   io_master_0_d_valid,
  input  [2:0] io_master_0_d_bits_opcode,
  input  [1:0] io_master_0_d_bits_param,
  input  [3:0] io_master_0_d_bits_size,
  input  [2:0] io_master_0_d_bits_source,
  input  [3:0] io_master_0_d_bits_sink,
  input  [3:0] io_master_0_d_bits_addr_lo,
  input  [127:0] io_master_0_d_bits_data,
  input   io_master_0_d_bits_error,
  input   io_master_0_e_ready,
  output  io_master_0_e_valid,
  output [3:0] io_master_0_e_bits_sink,
  input   io_master_1_a_ready,
  output  io_master_1_a_valid,
  output [2:0] io_master_1_a_bits_opcode,
  output [2:0] io_master_1_a_bits_param,
  output [3:0] io_master_1_a_bits_size,
  output [2:0] io_master_1_a_bits_source,
  output [31:0] io_master_1_a_bits_address,
  output [15:0] io_master_1_a_bits_mask,
  output [127:0] io_master_1_a_bits_data,
  output  io_master_1_b_ready,
  input   io_master_1_b_valid,
  input  [2:0] io_master_1_b_bits_opcode,
  input  [1:0] io_master_1_b_bits_param,
  input  [3:0] io_master_1_b_bits_size,
  input  [2:0] io_master_1_b_bits_source,
  input  [31:0] io_master_1_b_bits_address,
  input  [15:0] io_master_1_b_bits_mask,
  input  [127:0] io_master_1_b_bits_data,
  input   io_master_1_c_ready,
  output  io_master_1_c_valid,
  output [2:0] io_master_1_c_bits_opcode,
  output [2:0] io_master_1_c_bits_param,
  output [3:0] io_master_1_c_bits_size,
  output [2:0] io_master_1_c_bits_source,
  output [31:0] io_master_1_c_bits_address,
  output [127:0] io_master_1_c_bits_data,
  output  io_master_1_c_bits_error,
  output  io_master_1_d_ready,
  input   io_master_1_d_valid,
  input  [2:0] io_master_1_d_bits_opcode,
  input  [1:0] io_master_1_d_bits_param,
  input  [3:0] io_master_1_d_bits_size,
  input  [2:0] io_master_1_d_bits_source,
  input  [3:0] io_master_1_d_bits_sink,
  input  [3:0] io_master_1_d_bits_addr_lo,
  input  [127:0] io_master_1_d_bits_data,
  input   io_master_1_d_bits_error,
  input   io_master_1_e_ready,
  output  io_master_1_e_valid,
  output [3:0] io_master_1_e_bits_sink,
  input  [63:0] io_hartid,
  input   io_interrupts_debug,
  input   io_interrupts_mtip,
  input   io_interrupts_msip,
  input   io_interrupts_meip,
  input   io_interrupts_seip,
  input  [63:0] io_resetVector
);


reg io_master_0_a_ready_r;
reg io_master_0_b_valid_r;
reg [2:0] io_master_0_b_bits_opcode_r;
reg [1:0] io_master_0_b_bits_param_r;
reg [3:0] io_master_0_b_bits_size_r;
reg [2:0] io_master_0_b_bits_source_r;
reg [31:0] io_master_0_b_bits_address_r;
reg [15:0] io_master_0_b_bits_mask_r;
reg [127:0] io_master_0_b_bits_data_r;
reg io_master_0_c_ready_r;
reg io_master_0_d_valid_r;
reg [2:0] io_master_0_d_bits_opcode_r;
reg [1:0] io_master_0_d_bits_param_r;
reg [3:0] io_master_0_d_bits_size_r;
reg [2:0] io_master_0_d_bits_source_r;
reg [3:0] io_master_0_d_bits_sink_r;
reg [3:0] io_master_0_d_bits_addr_lo_r;
reg [127:0] io_master_0_d_bits_data_r;
reg io_master_0_d_bits_error_r;
reg io_master_0_e_ready_r;
reg io_master_1_a_ready_r;
reg io_master_1_b_valid_r;
reg [2:0] io_master_1_b_bits_opcode_r;
reg [1:0] io_master_1_b_bits_param_r;
reg [3:0] io_master_1_b_bits_size_r;
reg [2:0] io_master_1_b_bits_source_r;
reg [31:0] io_master_1_b_bits_address_r;
reg [15:0] io_master_1_b_bits_mask_r;
reg [127:0] io_master_1_b_bits_data_r;
reg io_master_1_c_ready_r;
reg io_master_1_d_valid_r;
reg [2:0] io_master_1_d_bits_opcode_r;
reg [1:0] io_master_1_d_bits_param_r;
reg [3:0] io_master_1_d_bits_size_r;
reg [2:0] io_master_1_d_bits_source_r;
reg [3:0] io_master_1_d_bits_sink_r;
reg [3:0] io_master_1_d_bits_addr_lo_r;
reg [127:0] io_master_1_d_bits_data_r;
reg io_master_1_d_bits_error_r;
reg io_master_1_e_ready_r;
reg [63:0] io_hartid_r;
reg io_interrupts_debug_r;
reg io_interrupts_mtip_r;
reg io_interrupts_msip_r;
reg io_interrupts_meip_r;
reg io_interrupts_seip_r;
reg [63:0] io_resetVector_r;
reg io_master_0_a_valid_r;
reg [2:0] io_master_0_a_bits_opcode_r;
reg [2:0] io_master_0_a_bits_param_r;
reg [3:0] io_master_0_a_bits_size_r;
reg [2:0] io_master_0_a_bits_source_r;
reg [31:0] io_master_0_a_bits_address_r;
reg [15:0] io_master_0_a_bits_mask_r;
reg [127:0] io_master_0_a_bits_data_r;
reg io_master_0_b_ready_r;
reg io_master_0_c_valid_r;
reg [2:0] io_master_0_c_bits_opcode_r;
reg [2:0] io_master_0_c_bits_param_r;
reg [3:0] io_master_0_c_bits_size_r;
reg [2:0] io_master_0_c_bits_source_r;
reg [31:0] io_master_0_c_bits_address_r;
reg [127:0] io_master_0_c_bits_data_r;
reg io_master_0_c_bits_error_r;
reg io_master_0_d_ready_r;
reg io_master_0_e_valid_r;
reg [3:0] io_master_0_e_bits_sink_r;
reg io_master_1_a_valid_r;
reg [2:0] io_master_1_a_bits_opcode_r;
reg [2:0] io_master_1_a_bits_param_r;
reg [3:0] io_master_1_a_bits_size_r;
reg [2:0] io_master_1_a_bits_source_r;
reg [31:0] io_master_1_a_bits_address_r;
reg [15:0] io_master_1_a_bits_mask_r;
reg [127:0] io_master_1_a_bits_data_r;
reg io_master_1_b_ready_r;
reg io_master_1_c_valid_r;
reg [2:0] io_master_1_c_bits_opcode_r;
reg [2:0] io_master_1_c_bits_param_r;
reg [3:0] io_master_1_c_bits_size_r;
reg [2:0] io_master_1_c_bits_source_r;
reg [31:0] io_master_1_c_bits_address_r;
reg [127:0] io_master_1_c_bits_data_r;
reg io_master_1_c_bits_error_r;
reg io_master_1_d_ready_r;
reg io_master_1_e_valid_r;
reg [3:0] io_master_1_e_bits_sink_r;

reg io_master_0_a_valid_o;
reg [2:0] io_master_0_a_bits_opcode_o;
reg [2:0] io_master_0_a_bits_param_o;
reg [3:0] io_master_0_a_bits_size_o;
reg [2:0] io_master_0_a_bits_source_o;
reg [31:0] io_master_0_a_bits_address_o;
reg [15:0] io_master_0_a_bits_mask_o;
reg [127:0] io_master_0_a_bits_data_o;
reg io_master_0_b_ready_o;
reg io_master_0_c_valid_o;
reg [2:0] io_master_0_c_bits_opcode_o;
reg [2:0] io_master_0_c_bits_param_o;
reg [3:0] io_master_0_c_bits_size_o;
reg [2:0] io_master_0_c_bits_source_o;
reg [31:0] io_master_0_c_bits_address_o;
reg [127:0] io_master_0_c_bits_data_o;
reg io_master_0_c_bits_error_o;
reg io_master_0_d_ready_o;
reg io_master_0_e_valid_o;
reg [3:0] io_master_0_e_bits_sink_o;
reg io_master_1_a_valid_o;
reg [2:0] io_master_1_a_bits_opcode_o;
reg [2:0] io_master_1_a_bits_param_o;
reg [3:0] io_master_1_a_bits_size_o;
reg [2:0] io_master_1_a_bits_source_o;
reg [31:0] io_master_1_a_bits_address_o;
reg [15:0] io_master_1_a_bits_mask_o;
reg [127:0] io_master_1_a_bits_data_o;
reg io_master_1_b_ready_o;
reg io_master_1_c_valid_o;
reg [2:0] io_master_1_c_bits_opcode_o;
reg [2:0] io_master_1_c_bits_param_o;
reg [3:0] io_master_1_c_bits_size_o;
reg [2:0] io_master_1_c_bits_source_o;
reg [31:0] io_master_1_c_bits_address_o;
reg [127:0] io_master_1_c_bits_data_o;
reg io_master_1_c_bits_error_o;
reg io_master_1_d_ready_o;
reg io_master_1_e_valid_o;
reg [3:0] io_master_1_e_bits_sink_o;

always @(posedge clock /*or posedge reset*/) begin
  if (reset) begin
    // reset
    io_master_0_a_ready_r<=0;
    io_master_0_b_valid_r<=0;
    io_master_0_b_bits_opcode_r<=0;
    io_master_0_b_bits_param_r<=0;
    io_master_0_b_bits_size_r<=0;
    io_master_0_b_bits_source_r<=0;
    io_master_0_b_bits_address_r<=0;
    io_master_0_b_bits_mask_r<=0;
    io_master_0_b_bits_data_r<=0;
    io_master_0_c_ready_r<=0;
    io_master_0_d_valid_r<=0;
    io_master_0_d_bits_opcode_r<=0;
    io_master_0_d_bits_param_r<=0;
    io_master_0_d_bits_size_r<=0;
    io_master_0_d_bits_source_r<=0;
    io_master_0_d_bits_sink_r<=0;
    io_master_0_d_bits_addr_lo_r<=0;
    io_master_0_d_bits_data_r<=0;
    io_master_0_d_bits_error_r<=0;
    io_master_0_e_ready_r<=0;
    io_master_1_a_ready_r<=0;
    io_master_1_b_valid_r<=0;
    io_master_1_b_bits_opcode_r<=0;
    io_master_1_b_bits_param_r<=0;
    io_master_1_b_bits_size_r<=0;
    io_master_1_b_bits_source_r<=0;
    io_master_1_b_bits_address_r<=0;
    io_master_1_b_bits_mask_r<=0;
    io_master_1_b_bits_data_r<=0;
    io_master_1_c_ready_r<=0;
    io_master_1_d_valid_r<=0;
    io_master_1_d_bits_opcode_r<=0;
    io_master_1_d_bits_param_r<=0;
    io_master_1_d_bits_size_r<=0;
    io_master_1_d_bits_source_r<=0;
    io_master_1_d_bits_sink_r<=0;
    io_master_1_d_bits_addr_lo_r<=0;
    io_master_1_d_bits_data_r<=0;
    io_master_1_d_bits_error_r<=0;
    io_master_1_e_ready_r<=0;
    io_hartid_r<=0;
    io_interrupts_debug_r<=0;
    io_interrupts_mtip_r<=0;
    io_interrupts_msip_r<=0;
    io_interrupts_meip_r<=0;
    io_interrupts_seip_r<=0;
    io_resetVector_r<=0;
  end
  else begin
    io_master_0_a_ready_r<=io_master_0_a_ready;
    io_master_0_b_valid_r<=io_master_0_b_valid;
    io_master_0_b_bits_opcode_r<=io_master_0_b_bits_opcode;
    io_master_0_b_bits_param_r<=io_master_0_b_bits_param;
    io_master_0_b_bits_size_r<=io_master_0_b_bits_size;
    io_master_0_b_bits_source_r<=io_master_0_b_bits_source;
    io_master_0_b_bits_address_r<=io_master_0_b_bits_address;
    io_master_0_b_bits_mask_r<=io_master_0_b_bits_mask;
    io_master_0_b_bits_data_r<=io_master_0_b_bits_data;
    io_master_0_c_ready_r<=io_master_0_c_ready;
    io_master_0_d_valid_r<=io_master_0_d_valid;
    io_master_0_d_bits_opcode_r<=io_master_0_d_bits_opcode;
    io_master_0_d_bits_param_r<=io_master_0_d_bits_param;
    io_master_0_d_bits_size_r<=io_master_0_d_bits_size;
    io_master_0_d_bits_source_r<=io_master_0_d_bits_source;
    io_master_0_d_bits_sink_r<=io_master_0_d_bits_sink;
    io_master_0_d_bits_addr_lo_r<=io_master_0_d_bits_addr_lo;
    io_master_0_d_bits_data_r<=io_master_0_d_bits_data;
    io_master_0_d_bits_error_r<=io_master_0_d_bits_error;
    io_master_0_e_ready_r<=io_master_0_e_ready;
    io_master_1_a_ready_r<=io_master_1_a_ready;
    io_master_1_b_valid_r<=io_master_1_b_valid;
    io_master_1_b_bits_opcode_r<=io_master_1_b_bits_opcode;
    io_master_1_b_bits_param_r<=io_master_1_b_bits_param;
    io_master_1_b_bits_size_r<=io_master_1_b_bits_size;
    io_master_1_b_bits_source_r<=io_master_1_b_bits_source;
    io_master_1_b_bits_address_r<=io_master_1_b_bits_address;
    io_master_1_b_bits_mask_r<=io_master_1_b_bits_mask;
    io_master_1_b_bits_data_r<=io_master_1_b_bits_data;
    io_master_1_c_ready_r<=io_master_1_c_ready;
    io_master_1_d_valid_r<=io_master_1_d_valid;
    io_master_1_d_bits_opcode_r<=io_master_1_d_bits_opcode;
    io_master_1_d_bits_param_r<=io_master_1_d_bits_param;
    io_master_1_d_bits_size_r<=io_master_1_d_bits_size;
    io_master_1_d_bits_source_r<=io_master_1_d_bits_source;
    io_master_1_d_bits_sink_r<=io_master_1_d_bits_sink;
    io_master_1_d_bits_addr_lo_r<=io_master_1_d_bits_addr_lo;
    io_master_1_d_bits_data_r<=io_master_1_d_bits_data;
    io_master_1_d_bits_error_r<=io_master_1_d_bits_error;
    io_master_1_e_ready_r<=io_master_1_e_ready;
    io_hartid_r<=io_hartid;
    io_interrupts_debug_r<=io_interrupts_debug;
    io_interrupts_mtip_r<=io_interrupts_mtip;
    io_interrupts_msip_r<=io_interrupts_msip;
    io_interrupts_meip_r<=io_interrupts_meip;
    io_interrupts_seip_r<=io_interrupts_seip;
    io_resetVector_r<=io_resetVector;
  end
end

always @(posedge clock /*or posedge reset*/) begin
  if (reset) begin
    // reset
    io_master_0_a_valid_o <= 0;
    io_master_0_a_bits_opcode_o <= 0;
    io_master_0_a_bits_param_o <= 0;
    io_master_0_a_bits_size_o <= 0;
    io_master_0_a_bits_source_o <= 0;
    io_master_0_a_bits_address_o <= 0;
    io_master_0_a_bits_mask_o <= 0;
    io_master_0_a_bits_data_o <= 0;
    io_master_0_b_ready_o <= 0;
    io_master_0_c_valid_o <= 0;
    io_master_0_c_bits_opcode_o <= 0;
    io_master_0_c_bits_param_o <= 0;
    io_master_0_c_bits_size_o <= 0;
    io_master_0_c_bits_source_o <= 0;
    io_master_0_c_bits_address_o <= 0;
    io_master_0_c_bits_data_o <= 0;
    io_master_0_c_bits_error_o <= 0;
    io_master_0_d_ready_o <= 0;
    io_master_0_e_valid_o <= 0;
    io_master_0_e_bits_sink_o <= 0;
    io_master_1_a_valid_o <= 0;
    io_master_1_a_bits_opcode_o <= 0;
    io_master_1_a_bits_param_o <= 0;
    io_master_1_a_bits_size_o <= 0;
    io_master_1_a_bits_source_o <= 0;
    io_master_1_a_bits_address_o <= 0;
    io_master_1_a_bits_mask_o <= 0;
    io_master_1_a_bits_data_o <= 0;
    io_master_1_b_ready_o <= 0;
    io_master_1_c_valid_o <= 0;
    io_master_1_c_bits_opcode_o <= 0;
    io_master_1_c_bits_param_o <= 0;
    io_master_1_c_bits_size_o <= 0;
    io_master_1_c_bits_source_o <= 0;
    io_master_1_c_bits_address_o <= 0;
    io_master_1_c_bits_data_o <= 0;
    io_master_1_c_bits_error_o <= 0;
    io_master_1_d_ready_o <= 0;
    io_master_1_e_valid_o <= 0;
    io_master_1_e_bits_sink_o <= 0;
  end
  else begin
    io_master_0_a_valid_o <= io_master_0_a_valid_r;
    io_master_0_a_bits_opcode_o <= io_master_0_a_bits_opcode_r;
    io_master_0_a_bits_param_o <= io_master_0_a_bits_param_r;
    io_master_0_a_bits_size_o <= io_master_0_a_bits_size_r;
    io_master_0_a_bits_source_o <= io_master_0_a_bits_source_r;
    io_master_0_a_bits_address_o <= io_master_0_a_bits_address_r;
    io_master_0_a_bits_mask_o <= io_master_0_a_bits_mask_r;
    io_master_0_a_bits_data_o <= io_master_0_a_bits_data_r;
    io_master_0_b_ready_o <= io_master_0_b_ready_r;
    io_master_0_c_valid_o <= io_master_0_c_valid_r;
    io_master_0_c_bits_opcode_o <= io_master_0_c_bits_opcode_r;
    io_master_0_c_bits_param_o <= io_master_0_c_bits_param_r;
    io_master_0_c_bits_size_o <= io_master_0_c_bits_size_r;
    io_master_0_c_bits_source_o <= io_master_0_c_bits_source_r;
    io_master_0_c_bits_address_o <= io_master_0_c_bits_address_r;
    io_master_0_c_bits_data_o <= io_master_0_c_bits_data_r;
    io_master_0_c_bits_error_o <= io_master_0_c_bits_error_r;
    io_master_0_d_ready_o <= io_master_0_d_ready_r;
    io_master_0_e_valid_o <= io_master_0_e_valid_r;
    io_master_0_e_bits_sink_o <= io_master_0_e_bits_sink_r;
    io_master_1_a_valid_o <= io_master_1_a_valid_r;
    io_master_1_a_bits_opcode_o <= io_master_1_a_bits_opcode_r;
    io_master_1_a_bits_param_o <= io_master_1_a_bits_param_r;
    io_master_1_a_bits_size_o <= io_master_1_a_bits_size_r;
    io_master_1_a_bits_source_o <= io_master_1_a_bits_source_r;
    io_master_1_a_bits_address_o <= io_master_1_a_bits_address_r;
    io_master_1_a_bits_mask_o <= io_master_1_a_bits_mask_r;
    io_master_1_a_bits_data_o <= io_master_1_a_bits_data_r;
    io_master_1_b_ready_o <= io_master_1_b_ready_r;
    io_master_1_c_valid_o <= io_master_1_c_valid_r;
    io_master_1_c_bits_opcode_o <= io_master_1_c_bits_opcode_r;
    io_master_1_c_bits_param_o <= io_master_1_c_bits_param_r;
    io_master_1_c_bits_size_o <= io_master_1_c_bits_size_r;
    io_master_1_c_bits_source_o <= io_master_1_c_bits_source_r;
    io_master_1_c_bits_address_o <= io_master_1_c_bits_address_r;
    io_master_1_c_bits_data_o <= io_master_1_c_bits_data_r;
    io_master_1_c_bits_error_o <= io_master_1_c_bits_error_r;
    io_master_1_d_ready_o <= io_master_1_d_ready_r;
    io_master_1_e_valid_o <= io_master_1_e_valid_r;
    io_master_1_e_bits_sink_o <= io_master_1_e_bits_sink_r;

  end
end

assign io_master_0_a_valid=io_master_0_a_valid_o;
assign io_master_0_a_bits_opcode=io_master_0_a_bits_opcode_o;
assign io_master_0_a_bits_param=io_master_0_a_bits_param_o;
assign io_master_0_a_bits_size=io_master_0_a_bits_size_o;
assign io_master_0_a_bits_source=io_master_0_a_bits_source_o;
assign io_master_0_a_bits_address=io_master_0_a_bits_address_o;
assign io_master_0_a_bits_mask=io_master_0_a_bits_mask_o;
assign io_master_0_a_bits_data=io_master_0_a_bits_data_o;
assign io_master_0_b_ready=io_master_0_b_ready_o;
assign io_master_0_c_valid=io_master_0_c_valid_o;
assign io_master_0_c_bits_opcode=io_master_0_c_bits_opcode_o;
assign io_master_0_c_bits_param=io_master_0_c_bits_param_o;
assign io_master_0_c_bits_size=io_master_0_c_bits_size_o;
assign io_master_0_c_bits_source=io_master_0_c_bits_source_o;
assign io_master_0_c_bits_address=io_master_0_c_bits_address_o;
assign io_master_0_c_bits_data=io_master_0_c_bits_data_o;
assign io_master_0_c_bits_error=io_master_0_c_bits_error_o;
assign io_master_0_d_ready=io_master_0_d_ready_o;
assign io_master_0_e_valid=io_master_0_e_valid_o;
assign io_master_0_e_bits_sink=io_master_0_e_bits_sink_o;
assign io_master_1_a_valid=io_master_1_a_valid_o;
assign io_master_1_a_bits_opcode=io_master_1_a_bits_opcode_o;
assign io_master_1_a_bits_param=io_master_1_a_bits_param_o;
assign io_master_1_a_bits_size=io_master_1_a_bits_size_o;
assign io_master_1_a_bits_source=io_master_1_a_bits_source_o;
assign io_master_1_a_bits_address=io_master_1_a_bits_address_o;
assign io_master_1_a_bits_mask=io_master_1_a_bits_mask_o;
assign io_master_1_a_bits_data=io_master_1_a_bits_data_o;
assign io_master_1_b_ready=io_master_1_b_ready_o;
assign io_master_1_c_valid=io_master_1_c_valid_o;
assign io_master_1_c_bits_opcode=io_master_1_c_bits_opcode_o;
assign io_master_1_c_bits_param=io_master_1_c_bits_param_o;
assign io_master_1_c_bits_size=io_master_1_c_bits_size_o;
assign io_master_1_c_bits_source=io_master_1_c_bits_source_o;
assign io_master_1_c_bits_address=io_master_1_c_bits_address_o;
assign io_master_1_c_bits_data=io_master_1_c_bits_data_o;
assign io_master_1_c_bits_error=io_master_1_c_bits_error_o;
assign io_master_1_d_ready=io_master_1_d_ready_o;
assign io_master_1_e_valid=io_master_1_e_valid_o;
assign io_master_1_e_bits_sink=io_master_1_e_bits_sink_o;

RocketTile RocketTile(
.clock(clock),
.reset(reset),
.io_master_0_a_ready(io_master_0_a_ready_r),
.io_master_0_b_valid(io_master_0_b_valid_r),
.io_master_0_b_bits_opcode(io_master_0_b_bits_opcode_r),
.io_master_0_b_bits_param(io_master_0_b_bits_param_r),
.io_master_0_b_bits_size(io_master_0_b_bits_size_r),
.io_master_0_b_bits_source(io_master_0_b_bits_source_r),
.io_master_0_b_bits_address(io_master_0_b_bits_address_r),
.io_master_0_b_bits_mask(io_master_0_b_bits_mask_r),
.io_master_0_b_bits_data(io_master_0_b_bits_data_r),
.io_master_0_c_ready(io_master_0_c_ready_r),
.io_master_0_d_valid(io_master_0_d_valid_r),
.io_master_0_d_bits_opcode(io_master_0_d_bits_opcode_r),
.io_master_0_d_bits_param(io_master_0_d_bits_param_r),
.io_master_0_d_bits_size(io_master_0_d_bits_size_r),
.io_master_0_d_bits_source(io_master_0_d_bits_source_r),
.io_master_0_d_bits_sink(io_master_0_d_bits_sink_r),
.io_master_0_d_bits_addr_lo(io_master_0_d_bits_addr_lo_r),
.io_master_0_d_bits_data(io_master_0_d_bits_data_r),
.io_master_0_d_bits_error(io_master_0_d_bits_error_r),
.io_master_0_e_ready(io_master_0_e_ready_r),
.io_master_1_a_ready(io_master_1_a_ready_r),
.io_master_1_b_valid(io_master_1_b_valid_r),
.io_master_1_b_bits_opcode(io_master_1_b_bits_opcode_r),
.io_master_1_b_bits_param(io_master_1_b_bits_param_r),
.io_master_1_b_bits_size(io_master_1_b_bits_size_r),
.io_master_1_b_bits_source(io_master_1_b_bits_source_r),
.io_master_1_b_bits_address(io_master_1_b_bits_address_r),
.io_master_1_b_bits_mask(io_master_1_b_bits_mask_r),
.io_master_1_b_bits_data(io_master_1_b_bits_data_r),
.io_master_1_c_ready(io_master_1_c_ready_r),
.io_master_1_d_valid(io_master_1_d_valid_r),
.io_master_1_d_bits_opcode(io_master_1_d_bits_opcode_r),
.io_master_1_d_bits_param(io_master_1_d_bits_param_r),
.io_master_1_d_bits_size(io_master_1_d_bits_size_r),
.io_master_1_d_bits_source(io_master_1_d_bits_source_r),
.io_master_1_d_bits_sink(io_master_1_d_bits_sink_r),
.io_master_1_d_bits_addr_lo(io_master_1_d_bits_addr_lo_r),
.io_master_1_d_bits_data(io_master_1_d_bits_data_r),
.io_master_1_d_bits_error(io_master_1_d_bits_error_r),
.io_master_1_e_ready(io_master_1_e_ready_r),
.io_hartid(io_hartid_r),
.io_interrupts_debug(io_interrupts_debug_r),
.io_interrupts_mtip(io_interrupts_mtip_r),
.io_interrupts_msip(io_interrupts_msip_r),
.io_interrupts_meip(io_interrupts_meip_r),
.io_interrupts_seip(io_interrupts_seip_r),
.io_resetVector(io_resetVector_r),
.io_master_0_a_valid(io_master_0_a_valid_r),
.io_master_0_a_bits_opcode(io_master_0_a_bits_opcode_r),
.io_master_0_a_bits_param(io_master_0_a_bits_param_r),
.io_master_0_a_bits_size(io_master_0_a_bits_size_r),
.io_master_0_a_bits_source(io_master_0_a_bits_source_r),
.io_master_0_a_bits_address(io_master_0_a_bits_address_r),
.io_master_0_a_bits_mask(io_master_0_a_bits_mask_r),
.io_master_0_a_bits_data(io_master_0_a_bits_data_r),
.io_master_0_b_ready(io_master_0_b_ready_r),
.io_master_0_c_valid(io_master_0_c_valid_r),
.io_master_0_c_bits_opcode(io_master_0_c_bits_opcode_r),
.io_master_0_c_bits_param(io_master_0_c_bits_param_r),
.io_master_0_c_bits_size(io_master_0_c_bits_size_r),
.io_master_0_c_bits_source(io_master_0_c_bits_source_r),
.io_master_0_c_bits_address(io_master_0_c_bits_address_r),
.io_master_0_c_bits_data(io_master_0_c_bits_data_r),
.io_master_0_c_bits_error(io_master_0_c_bits_error_r),
.io_master_0_d_ready(io_master_0_d_ready_r),
.io_master_0_e_valid(io_master_0_e_valid_r),
.io_master_0_e_bits_sink(io_master_0_e_bits_sink_r),
.io_master_1_a_valid(io_master_1_a_valid_r),
.io_master_1_a_bits_opcode(io_master_1_a_bits_opcode_r),
.io_master_1_a_bits_param(io_master_1_a_bits_param_r),
.io_master_1_a_bits_size(io_master_1_a_bits_size_r),
.io_master_1_a_bits_source(io_master_1_a_bits_source_r),
.io_master_1_a_bits_address(io_master_1_a_bits_address_r),
.io_master_1_a_bits_mask(io_master_1_a_bits_mask_r),
.io_master_1_a_bits_data(io_master_1_a_bits_data_r),
.io_master_1_b_ready(io_master_1_b_ready_r),
.io_master_1_c_valid(io_master_1_c_valid_r),
.io_master_1_c_bits_opcode(io_master_1_c_bits_opcode_r),
.io_master_1_c_bits_param(io_master_1_c_bits_param_r),
.io_master_1_c_bits_size(io_master_1_c_bits_size_r),
.io_master_1_c_bits_source(io_master_1_c_bits_source_r),
.io_master_1_c_bits_address(io_master_1_c_bits_address_r),
.io_master_1_c_bits_data(io_master_1_c_bits_data_r),
.io_master_1_c_bits_error(io_master_1_c_bits_error_r),
.io_master_1_d_ready(io_master_1_d_ready_r),
.io_master_1_e_valid(io_master_1_e_valid_r),
.io_master_1_e_bits_sink(io_master_1_e_bits_sink_r)
);
endmodule
