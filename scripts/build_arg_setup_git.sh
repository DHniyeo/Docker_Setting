#!/bin/bash
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
DOCKER_TEPL_DIR=$(dirname "$SCRIPT_DIR")
TOOL_DIR=${DOCKER_TEPL_DIR}/make_env

CONF_FILE="${TOOL_DIR}/default_info.conf"

# 2. 파일 로드 및 에러 처리
if [ -f "$CONF_FILE" ]; then
    source "$CONF_FILE"
else
    echo "[ERROR] $CONF_FILE not found!" >&2
    exit 1
fi

echo "--build-arg GIT_USER_EMAIL=${GIT_USER_EMAIL} --build-arg GIT_USER_NAME=\"${GIT_USER_NAME}\""