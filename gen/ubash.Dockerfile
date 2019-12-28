# =============================================================================
#
# THIS FILE WAS GENERATED USING JINJA TEMPLATING ANY EDITS TO THIS FILE WILL BE 
# OVERWRITTEN ON THE NEXT RENDER / BUILD.
#
# -----------------------------------------------------------------------------
FROM ubuntu:18.04

USER root

RUN apt-get update && \
    apt-get install -y \
    curl \
    git \
    unzip \
    vim

# =============================================================================
#   Setup a non-root, sudoer account for development
#
ARG dev_password

USER root

RUN apt-get update && \
    apt-get install -y sudo && \
    useradd -mU \
            -p ${dev_password} \
            -s /bin/bash \
            -G sudo \
            dev && \
    chown -R dev /home/dev && \
    chgrp -R dev /home/dev 

USER dev
WORKDIR /home/dev
# -----------------------------------------------------------------------------

