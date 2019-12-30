#!/usr/bin/env bash
scriptDir=$(dirname ${BASH_SOURCE[0]})

if [[ -z "$1" ]]; then
    echo "Please provide an image to push."
    exit 1
fi

docker tag ${1} ${2}
docker push ${2}