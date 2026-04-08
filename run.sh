#!/bin/bash

if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo ".env 파일이 없습니다!"
    exit 1
fi

mkdir -p ${PJT_PATH}

DEVICE_ARGS=$(./scripts/run_arg_setup_devices.sh)
SSH_ARGS=$(./scripts/run_arg_setup_ssh.sh)

docker run --rm -it \
    -v ${PJT_PATH}:${PJT_PATH}\
    -w ${PJT_PATH}\
    $DEVICE_ARGS \
    ${SSH_ARGS} \
    ${DOCKER_IMAGE_TAG}
