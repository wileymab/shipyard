#!/usr/bin/env bash
scriptDir=$(dirname ${BASH_SOURCE[0]})

"${scriptDir}/render.sh" "${1}"
"${scriptDir}/build.sh" "${1}" "${2}"