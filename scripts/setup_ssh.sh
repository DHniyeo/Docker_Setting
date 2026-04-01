#!/bin/bash
set -e
# scripts/setup_ssh.sh
USERNAME=$1

if [ -z "${USERNAME}" ]; then
    echo "[setup_ssh] ERROR: USERNAME is required"
    exit 1
fi

SSH_DIR=/home/${USERNAME}/.ssh
mkdir -p ${SSH_DIR}
chmod 700 ${SSH_DIR}

# 서버 fingerprint 등록 (known_hosts)
ssh-keyscan github.com >> ${SSH_DIR}/known_hosts
ssh-keyscan gitlab.com >> ${SSH_DIR}/known_hosts
chmod 600 ${SSH_DIR}/known_hosts
chown -R ${USERNAME}:${USERNAME} ${SSH_DIR}

echo "[setup_ssh] known_hosts configured for ${USERNAME}"