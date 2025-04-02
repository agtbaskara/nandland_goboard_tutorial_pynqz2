# Clock signal (125 MHz)
set_property -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS33} [get_ports i_Clk]
create_clock -period 8.000 -name sys_clk_pin -waveform {0.000 4.000} -add [get_ports i_Clk]

# UART
set_property PACKAGE_PIN Y8 [get_ports i_UART_RX]
set_property IOSTANDARD LVCMOS33 [get_ports i_UART_RX]

set_property PACKAGE_PIN W9 [get_ports o_UART_TX]
set_property IOSTANDARD LVCMOS33 [get_ports o_UART_TX]

# Output VGA
set_property PACKAGE_PIN V16 [get_ports o_VGA_HSync]
set_property IOSTANDARD LVCMOS33 [get_ports o_VGA_HSync]

set_property PACKAGE_PIN W16 [get_ports o_VGA_VSync]
set_property IOSTANDARD LVCMOS33 [get_ports o_VGA_VSync]

set_property PACKAGE_PIN Y18 [get_ports o_VGA_Red_0]
set_property IOSTANDARD LVCMOS33 [get_ports o_VGA_Red_0]

set_property PACKAGE_PIN Y19 [get_ports o_VGA_Red_1]
set_property IOSTANDARD LVCMOS33 [get_ports o_VGA_Red_1]

set_property PACKAGE_PIN Y16 [get_ports o_VGA_Red_2]
set_property IOSTANDARD LVCMOS33 [get_ports o_VGA_Red_2]

set_property PACKAGE_PIN Y17 [get_ports o_VGA_Red_3]
set_property IOSTANDARD LVCMOS33 [get_ports o_VGA_Red_3]

set_property PACKAGE_PIN W14 [get_ports o_VGA_Grn_0]
set_property IOSTANDARD LVCMOS33 [get_ports o_VGA_Grn_0]

set_property PACKAGE_PIN Y14 [get_ports o_VGA_Grn_1]
set_property IOSTANDARD LVCMOS33 [get_ports o_VGA_Grn_1]

set_property PACKAGE_PIN T11 [get_ports o_VGA_Grn_2]
set_property IOSTANDARD LVCMOS33 [get_ports o_VGA_Grn_2]

set_property PACKAGE_PIN T10 [get_ports o_VGA_Grn_3]
set_property IOSTANDARD LVCMOS33 [get_ports o_VGA_Grn_3]

set_property PACKAGE_PIN U18 [get_ports o_VGA_Blu_0]
set_property IOSTANDARD LVCMOS33 [get_ports o_VGA_Blu_0]

set_property PACKAGE_PIN U19 [get_ports o_VGA_Blu_1]
set_property IOSTANDARD LVCMOS33 [get_ports o_VGA_Blu_1]

set_property PACKAGE_PIN W18 [get_ports o_VGA_Blu_2]
set_property IOSTANDARD LVCMOS33 [get_ports o_VGA_Blu_2]

set_property PACKAGE_PIN W19 [get_ports o_VGA_Blu_3]
set_property IOSTANDARD LVCMOS33 [get_ports o_VGA_Blu_3]
