#!/bin/bash
# build.sh


if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo ".env 파일이 없습니다!"
    exit 1
fi

# 빌드 인자로 현재 사용자명 전달, 이미지 태그는 '사용자명-yocto'
docker build --build-arg USERNAME=$(whoami) \
             --build-arg host_uid=$(id -u) \
             --build-arg host_gid=$(id -g) \
             -t ${DOCKER_IMAGE_TAG} .

# 빌드 후 남은 찌꺼기 레이어 정리
docker image prune --force