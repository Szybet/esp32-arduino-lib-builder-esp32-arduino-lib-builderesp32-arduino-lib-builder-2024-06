FROM archlinux:latest

CMD ["/bin/bash"]

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm \
    base-devel \
    git \
    wget \
    curl \
    openssl \
    ncurses \
    flex \
    bison \
    gperf \
    python \
    python-pip \
    python-setuptools \
    python-pyserial \
    python-click \
    python-cryptography \
    python-future \
    python-pyparsing \
    python-pyelftools \
    cmake \
    ninja \
    ccache \
    jq

WORKDIR /app