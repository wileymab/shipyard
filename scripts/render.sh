#!/usr/bin/env bash
scriptDir=$(dirname ${BASH_SOURCE[0]})

function render {
    python "${scriptDir}/render.py" -t "${1}"
}

#
#
#

if [[ -z "$1" ]]; then
    echo "Please provide an image to render and build."
    exit 1
fi

template_file="${1}.Dockerfile.j2"
if [[ -f "src/${template_file}" ]]; then
    render $template_file
else
    echo "Unable to locate ${template_file}"
fi