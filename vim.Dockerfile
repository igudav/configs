# A Dockerfile that builds vim image with all dependencies

FROM ubuntu:20.04

# configuring tzdata
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# install vim and YCM dependencies
RUN apt-get update && apt-get install -y \
    sudo \
    git \
    wget \
    build-essential \
    cmake \
    vim-nox \
    python3-dev \
    exuberant-ctags \
    fzf \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*
    
RUN npm update -g npm && npm install -g n && n lts

ARG USERNAME
ARG UID
ENV USERNAME=$USERNAME
RUN useradd -m -s /bin/bash -u $UID -G sudo $USERNAME

USER $USERNAME
WORKDIR /home/$USERNAME
SHELL ["/bin/bash", "-c"]
ENTRYPOINT bash
