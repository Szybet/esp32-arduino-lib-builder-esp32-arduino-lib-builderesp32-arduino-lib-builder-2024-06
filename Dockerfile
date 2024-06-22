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
    python-cryptography \
    python-virtualenv \
    cmake \
    ninja \
    ccache \
    jq \
    python-textual \
    nano \
    p7zip

WORKDIR /app
