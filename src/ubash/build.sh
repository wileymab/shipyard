#!/usr/bin/env bash
scriptDir=$(dirname ${BASH_SOURCE[0]})
echo ${scriptDir}

source ${scriptDir}/../../.local/values.sh

echo ${DEV_PASSWORD_CT}
echo ${GITHUB_PASSWORD_URI}

docker build \
    --build-arg dev_password=${DEV_PASSWORD_CT} \
    --build-arg github_username=${GITHUB_USERNAME} \
    --build-arg github_password=${GITHUB_PASSWORD_URI} \
    -t ubash \
    -f ${scriptDir}/../../${1} \
    .