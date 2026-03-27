#!/bin/bash

if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo ".env 파일이 없습니다!"
    exit 1
fi

mkdir -p ${PJT_PATH}

DEVICE_ARGS=$(./scripts/setup_devices.sh)

docker run --rm -it \
    -v ${PJT_PATH}:/home/$(whoami)/${PJT_NAME} \
    -w /home/$(whoami)/${PJT_NAME} \
    $DEVICE_ARGS \
    ${DOCKER_IMAGE_TAG}