#!/bin/bash

#get relative path
PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$PARENT_PATH"
source ../run_util.sh

echo "Running simulations for ${SIMTIME_FULL}s simtime"
printf "\n"

FNAME=Opera_5paths_websearch_ndp_0.5sec_${SIMTIME}sec_50us.txt
FILES+=($FNAME)
COMMAND="../../src/opera/datacenter/htsim_ndp_dynexpTopology -utiltime 5e-04 -simtime $SIMTIME_FULL -cutoff 150000000000 -norlb -cwnd 20 -q 65 -pullrate 1 -topfile ../../topologies/dynexp_50us_10nsrc_5paths.txt -flowfile ../../traffic/websearch_uniform_40percLoad_0.5sec_648hosts.htsim > $FNAME"
run_sim
printf "\n"