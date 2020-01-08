#!/bin/bash

ARGC=2

# parameter checking
if ! [ $# -eq $ARGC ]; then
    echo -e "Not enough input parameters (needed: ${ARGC})..."
    exit
fi

MIN=$1      # get minimum range from command line
MAX=$2      # get maximum range from command line
SEED=$3     # get the seed to be passed in initially, if no seed is given, provide a default seed

make all    # compile Java and C parts

C_NUM="$(./number-generator ${MIN} ${MAX})"
P_NUM="$(python3 number-generator.py ${MIN} ${MAX} ${C_NUM})"
J_NUM="$(java Generator ${MIN} ${MAX} ${P_NUM})"

echo "Random Number: ${J_NUM}"

make clean  # clean up the mess