#!/bin/bash

# 1. 도구의 실제 위치 파악 (Docker_template/make_env)
TOOL_DIR=$(cd "$(dirname "$0")" && pwd)
DOCKER_TEPL_DIR=$(dirname "$TOOL_DIR")

set -a
# 2. 설정 파일 로드
if [ -f "$TOOL_DIR/default_info.conf" ]; then
    source "$TOOL_DIR/default_info.conf"
else
    echo "에러: $TOOL_DIR/default_info.conf 가 없습니다."
    exit 1
fi
set +a

# 3. 변수 가공
export PJT_NAME_UPPER=${PJT_NAME^^}
export PJT_NAME_LOWER=${PJT_NAME,,}

# 4. 템플릿을 읽어서 '현재 폴더'에 .env 생성
TEMPLATE_FILE="$TOOL_DIR/.env.template"

if [ -f "$TEMPLATE_FILE" ]; then
    # 결과물은 무조건 명령어를 치고 있는 현재 위치(./.env)에 생성
    envsubst < "$TEMPLATE_FILE" > "$DOCKER_TEPL_DIR/.env"
    echo "성공: $DOCKER_TEPL_DIR/.env 생성이 완료되었습니다."
else
    echo "에러: $TEMPLATE_FILE 을 찾을 수 없습니다."
fi