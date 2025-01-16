transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/admin/Documents/FPGA Design for Embedded Systems Specialization/Introduction to FPGA Design for Embedded Systems/pipemultQP16_1Design/pipemultQP16_1/Schematic/pipemult.vhd}
vcom -93 -work work {C:/Users/admin/Documents/FPGA Design for Embedded Systems Specialization/Introduction to FPGA Design for Embedded Systems/pipemultQP16_1Design/pipemultQP16_1/Schematic/ram.vhd}
vcom -93 -work work {C:/Users/admin/Documents/FPGA Design for Embedded Systems Specialization/Introduction to FPGA Design for Embedded Systems/pipemultQP16_1Design/pipemultQP16_1/Schematic/mult.vhd}

