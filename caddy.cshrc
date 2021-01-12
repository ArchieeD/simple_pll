module load base magic netgen xcelium matlab/caddy

# copy the magic config file if it doesn't exist already
cp -n /afs/ir.stanford.edu/class/ee272/PDKS/sky130A/libs.tech/magic/sky130A.magicrc .magicrc

# set the PDKPATH variable
setenv PDKPATH /afs/ir.stanford.edu/class/ee272/PDKS/sky130A

# add ngspice and gwave to the path
# ref: https://unix.stackexchange.com/a/77666
set -f path=("/cad/ngspice/33/bin" $path:q)
set -f path=("/cad/gaw3/bin" $path:q)
