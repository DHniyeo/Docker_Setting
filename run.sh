#!/bin/bash

if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo ".env 파일이 없습니다!"
    exit 1
fi

mkdir -p ${PJT_PATH}

docker run --rm -it \
    -v /home/`whoami`:/home/`whoami` --net=host `whoami`-yocto \