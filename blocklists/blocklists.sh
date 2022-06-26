#!/bin/bash

directoryname=$(dirname "$0");

function blocklistproject { source $directoryname/blocklistproject/blocklistproject.sh; }

function firebog { source $directoryname/firebog/firebog.sh; }

function lightswitch05 { source $directoryname/lightswitch05/lightswitch05.sh; }

function default { source $directoryname/default/default.sh; }

function neodevhost { source $directoryname/neodevhost/neodevhost.sh; }


function oisd { source $directoryname/oisd/oisd.sh; }


blocklistproject &
pid_blocklistproject=$!

firebog &
pid_firebog=$!

lightswitch05 &
pid_lightswitch05=$!

default &
pid_default=$!

neodevhost &
pid_neodevhost=$!

oisd &
pid_oisd=$!

wait $pid_oisd
wait $pid_neodevhost
wait $pid_default
wait $pid_lightswitch05
wait $pid_firebog
wait $pid_blocklistproject

pihole -g