#!/usr/bin/env bash

function build {
    docker build --build-arg dev_password=${3} -t "${2}" -f "${1}"  .
}

docker_file="${1}.Dockerfile"
tag="${1}"
if [[ -f "gen/${docker_file}" ]]; then
    build "gen/$docker_file" $tag "${2}"
else
    echo "Unable to locate ${docker_file}"
fi