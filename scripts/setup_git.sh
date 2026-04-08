#!/bin/bash
# scripts/setup_git.sh# scripts/setup_git.sh
set -e

USERNAME=$1
GIT_EMAIL=$2
GIT_NAME=$3

if [ -z "${USERNAME}" ] || [ -z "${GIT_EMAIL}" ] || [ -z "${GIT_NAME}" ]; then
    echo "[setup_git] ERROR: USERNAME, EMAIL, and NAME are required"
    exit 1
fi

# 변수 확장을 위해 큰따옴표(") 사용
su - ${USERNAME} -c "
    git config --global user.email '${GIT_EMAIL}'
    git config --global user.name '${GIT_NAME}'
"

echo "[setup_git] Done."

