# The refclk assignment may need to be renamed to match design top level port name.
# May be desireable to move refclk assignment to a top level SDC file.
create_clock -period "100 MHz" -name {refclk_pcie_compiler_0} {refclk_pcie_compiler_0}
create_clock -period "125 MHz" -name {fixedclk} {fixedclk_serdes_pcie_compiler_0}
# testin bits are either static or treated asynchronously, cut the paths.
set_false_path -to [get_pins -hierarchical {*hssi_pcie_hip|testin[*]} ]
set_false_path -from [get_clocks {*coreclk*}] -to [get_clocks {pll}]
set_false_path -from [get_clocks {pll}] -to [get_clocks {*coreclk*}]
