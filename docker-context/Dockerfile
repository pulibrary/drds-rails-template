# Based on https://stackoverflow.com/a/73999702
# Removed unnecessary steps, and split large RUN lines up,
# so if late changes are needed, more layers are chached.
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

# Install asdf
RUN \
    # configure git to get rid of detached head warnings
    git config --global advice.detachedHead false; \
    git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.10.2; \
    /bin/bash -c 'echo -e "\n\n## Configure ASDF \n. $HOME/.asdf/asdf.sh" >> ~/.bashrc'; \
    # /bin/bash -c 'echo -e "\n\n## ASDF Bash Completion: \n. $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc'; \
    exec bash; \
# install asdf-ruby
    /bin/bash -c asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git; \
# install asdf-nodejs
    /bin/bash -c asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git;

COPY .tool-versions .
RUN exec bash; /bin/bash -c asdf install