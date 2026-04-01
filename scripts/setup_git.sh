#!/bin/bash
# scripts/setup_git.sh
set -e

USERNAME=$1

if [ -z "${USERNAME}" ]; then
    echo "[setup_git] ERROR: USERNAME is required"
    exit 1
fi

su - ${USERNAME} -c '
    git config --global user.email "ehdgns915@gmail.com"
    git config --global user.name "DHniyeo"
'

echo "[setup_git] Done."