# Based on https://stackoverflow.com/a/73999702
# Removed unnecessary steps, and split up large RUN lines,
# so if later changes are needed, more layers are chached.
FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y curl git \
        software-properties-common \
# Extra dependencies for asdf
        gnupg2 apt-transport-https

# Extra dependencies for asdf-ruby
RUN apt-get install -y \
        build-essential autoconf \
        bison patch rustc \
        libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev \
        libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev
# Extra dependencies for asdf-nodejs
RUN apt-get install -y \
        dirmngr gawk 

# Configure git to get rid of detached head warnings
RUN git config --global advice.detachedHead false
# Install asdf
RUN git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.10.2; \
    /bin/bash -c 'echo -e "\n\n## Configure ASDF \n. $HOME/.asdf/asdf.sh" >> ~/.bashrc'
# We need to "exec bash" on every command below to provide the asdf environment:
RUN exec bash; /bin/bash -c asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git;
RUN exec bash; /bin/bash -c asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git;

# PUL specific details follow below:
COPY .tool-versions .
RUN exec bash; /bin/bash -c asdf install
RUN exec bash; gem install bundle

# Use "bundle add" to build up the Gemfile, rather than checking it in,
# so that upgrades for components don't invalidate entire layer.
RUN exec bash; bundle add rails --version '7.0.4'

RUN exec bash; bundle exec rails new pul-template