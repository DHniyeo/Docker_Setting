FROM ubuntu:22.04

# 필수 변수 및 환경 설정
ARG USERNAME
ARG host_uid=1000
ARG host_gid=1000

ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    DEBIAN_FRONTEND=noninteractive

# 필수 패키지 & 로케일
RUN apt update && apt install -y \
    gawk wget git diffstat unzip texinfo gcc-multilib build-essential \
    chrpath socat cpio python3 python3-pip xz-utils debianutils \
    iputils-ping python3-git python3-jinja2 libegl1-mesa locales sudo \
    curl python-is-python3 && \
    locale-gen en_US.UTF-8 && \
    ln -sf bash /bin/sh && \
    apt clean && rm -rf /var/lib/apt/lists/*

# 필수 도구 설치 (repo)
ADD https://storage.googleapis.com/git-repo-downloads/repo /usr/local/bin/repo
RUN chmod 755 /usr/local/bin/repo

# 사용자 생성
RUN groupadd -g ${host_gid} ${USERNAME} || true && \
    useradd -u ${host_uid} -g ${host_gid} -m -s /bin/bash ${USERNAME} && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Script ADD
COPY scripts/ /tmp/scripts/
RUN chmod +x /tmp/scripts/*.sh && \
    /tmp/scripts/setup_bashrc.sh ${USERNAME} && \
    /tmp/scripts/setup_ssh.sh ${USERNAME} && \
    /tmp/scripts/setup_devices.sh ${USERNAME} && \
    rm -rf /tmp/scripts

USER ${USERNAME}
WORKDIR /home/${USERNAME}
