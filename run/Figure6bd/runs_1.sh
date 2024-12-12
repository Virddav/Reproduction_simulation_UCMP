#!/bin/bash

#get relative path
PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$PARENT_PATH"
source ../run_util.sh

echo "Running simulations for ${SIMTIME_FULL}s simtime"
printf "\n"

FNAME=OptiRoute_datamining_ndp_0.5sec_${SIMTIME}sec_50us.txt
FILES+=($FNAME)
COMMAND="../../src/optiroute/datacenter/htsim_ndp_dynexpTopology -utiltime 5e-04 -simtime $SIMTIME_FULL -cutoff 35000000 -rlbflow 0 -cwnd 20 -q 65 -pullrate 1 -alphazero -routing OptiRoute -topfile ../../topologies/slice50us_portion1_queue0_optiroute_adaptive_paths_alpha_0.5.txt -flowfile ../../traffic/datamining_uniform_40percLoad_0.5sec_648hosts.htsim -slicedur 50000000 > $FNAME"
run_sim
printf "\n"