
vlib -quiet ece585-dram

vlog -quiet -writetoplevels questa.tops testbench.sv

# Debug
#vsim -f questa.tops -batch -do "vsim -voptargs=+acc=npr; run -all; exit" -voptargs=+acc=npr
# No Debug
vsim -quiet -f questa.tops -batch -do "vsim ; run -all; exit"

