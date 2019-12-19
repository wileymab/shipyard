FROM ruby:2.6

USER root

RUN apt-get update && \
    apt-get install -y sudo && \
    useradd -mU \
            -p eVm0lHECuKzCg \
            -s /bin/bash \
            -G sudo \
            dev

USER dev

ENTRYPOINT [ "bash" ]

# RUN echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc && \ 
#     echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc && \
#     echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc &&