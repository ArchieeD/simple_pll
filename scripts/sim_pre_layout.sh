mkdir -p sim_pre_layout

echo "* Include SKY130 libraries" > sim_pre_layout/pre.spice
echo ".lib \"$SKYWATER/libraries/sky130_fd_pr/latest/models/sky130.lib.spice\" tt" >> sim_pre_layout/pre.spice

cat sim_pre_layout/pre.spice ../net/inv1.spice ../net/ringosc.spice ../net/tb.spice > sim_pre_layout/sim.spice

ngspice -r sim_pre_layout/sim.raw -b sim_pre_layout/sim.spice
