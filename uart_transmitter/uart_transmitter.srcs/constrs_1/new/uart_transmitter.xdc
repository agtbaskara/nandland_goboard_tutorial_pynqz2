# Clock signal (125 MHz)
set_property -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS33} [get_ports i_Clk]
create_clock -period 8.000 -name sys_clk_pin -waveform {0.000 4.000} -add [get_ports i_Clk]

# UART
set_property PACKAGE_PIN Y8 [get_ports i_UART_RX]
set_property IOSTANDARD LVCMOS33 [get_ports i_UART_RX]

set_property PACKAGE_PIN W9 [get_ports o_UART_TX]
set_property IOSTANDARD LVCMOS33 [get_ports o_UART_TX]

# Output 7-segment display
set_property PACKAGE_PIN U18 [get_ports o_Segment_A]
set_property IOSTANDARD LVCMOS33 [get_ports o_Segment_A]

set_property PACKAGE_PIN U19 [get_ports o_Segment_B]
set_property IOSTANDARD LVCMOS33 [get_ports o_Segment_B]

set_property PACKAGE_PIN W18 [get_ports o_Segment_C]
set_property IOSTANDARD LVCMOS33 [get_ports o_Segment_C]

set_property PACKAGE_PIN W19 [get_ports o_Segment_D]
set_property IOSTANDARD LVCMOS33 [get_ports o_Segment_D]

set_property PACKAGE_PIN V16 [get_ports o_Segment_E]
set_property IOSTANDARD LVCMOS33 [get_ports o_Segment_E]

set_property PACKAGE_PIN W16 [get_ports o_Segment_F]
set_property IOSTANDARD LVCMOS33 [get_ports o_Segment_F]

set_property PACKAGE_PIN V12 [get_ports o_Segment_G]
set_property IOSTANDARD LVCMOS33 [get_ports o_Segment_G]

set_property PACKAGE_PIN W13 [get_ports o_Segment_Digit]
set_property IOSTANDARD LVCMOS33 [get_ports o_Segment_Digit]