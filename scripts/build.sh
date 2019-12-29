#!/usr/bin/env bash

function build {
    ./src/${1}/build.sh "${2}"
}

docker_file="gen/${1}/Dockerfile"
if [[ -f "${docker_file}" ]]; then
    build "${1}" "${docker_file}"
else
    echo "Unable to locate ${docker_file}"
fi