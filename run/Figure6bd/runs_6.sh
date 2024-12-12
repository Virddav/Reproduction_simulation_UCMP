#!/bin/bash

#get relative path
PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$PARENT_PATH"
source ../run_util.sh

echo "Running simulations for ${SIMTIME_FULL}s simtime"
printf "\n"

FNAME=ksp_topK=1_datamining_dctcp_0.5sec_${SIMTIME}sec_50us.txt
FILES+=($FNAME)
COMMAND="../../src/optiroute/datacenter/htsim_dctcp_dynexpTopology -utiltime 5e-04 -simtime $SIMTIME_FULL -cutoff 150000000000 -rlbflow 0 -cwnd 20 -q 300 -routing KShortest -topfile ../../topologies/general_from_dynexp_N=108_topK=1.txt -flowfile ../../traffic/datamining_uniform_40percLoad_0.5sec_648hosts.htsim -dctcpmarking 32 -slicedur 50000000 > $FNAME"
run_sim
printf "\n"