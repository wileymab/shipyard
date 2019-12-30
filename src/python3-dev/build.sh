#!/usr/bin/env bash
scriptDir=$(dirname ${BASH_SOURCE[0]})
source ${scriptDir}/../../.local/values.sh

docker build \
    -t python3-dev \
    -f ${scriptDir}/../../${1} \
    .