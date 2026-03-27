#!/bin/bash

if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo ".env 파일이 없습니다!"
    exit 1
fi

mkdir -p ${PJT_PATH}

docker run --rm -it \
    -v ${PJT_PATH}:/home/dhyeo/TDM-CC \
    ${DOCKER_IMAGE_TAG}