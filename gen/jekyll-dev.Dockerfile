# =============================================================================
#
# THIS FILE WAS GENERATED USING JINJA TEMPLATING ANY EDITS TO THIS FILE WILL BE 
# OVERWRITTEN ON THE NEXT RENDER / BUILD.
#
# -----------------------------------------------------------------------------
FROM ruby:2.6

ARG dev_password

USER root

RUN apt-get update && \
    apt-get install -y sudo && \
    useradd -mU \
            -p ${dev_password} \
            -s /bin/bash \
            -G sudo \
            dev

USER dev

RUN echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc && \ 
    echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc && \
    echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc && \
    gem install jekyll bundler

ENTRYPOINT [ "bash" ]