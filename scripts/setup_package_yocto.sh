#!/bin/bash
# install_yocto.sh
# Yocto build에 필요한 추가 패키지 설치 (Ubuntu 22.04 기준)
set -e

echo "[install_yocto] Installing Yocto-specific packages..."

apt-get update && apt-get install -y --no-install-recommends \
    `# Python 관련` \
    python3-pexpect \
    python3-subunit \
    \
    `# 압축/파일 처리` \
    zstd \
    liblz4-tool \
    file \
    libacl1 \
    \
    `# 빌드 도구` \
    flex \
    bison \
    bc \
    rsync \
    autoconf \
    kmod \
    libssl-dev \
    libncurses5-dev \
    lib32z1 \
    \
    `# 문서/XML 처리` \
    docbook-utils \
    fop \
    dblatex \
    xmlto \
    libxml-simple-perl \
    gettext \
    xsltproc \
    \
    `# UI/디버그 도구` \
    xterm \
    libsdl1.2-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

echo "[install_yocto] Done."