#!/bin/bash

# Dockerfile에서 넘겨준 ${USERNAME}을 첫 번째 인자로 받음
TARGET_USER=$1
TARGET_HOME="/home/$TARGET_USER"

echo "Configuring .bashrc for user: $TARGET_USER"

# 1. 기존 .bashrc 확인 및 생성
if [ ! -f "$TARGET_HOME/.bashrc" ]; then
touch "$TARGET_HOME/.bashrc"
fi

# 2. 설정 추가 (들여쓰기 없이 벽에 붙여서 작성)
cat << 'EOF' >> "$TARGET_HOME/.bashrc"

# --- Docker Environment Customization ---
export PS1="\[\e[31m\][DOCKER]\[\e[m\] \[\e[32m\]\u@\h:\[\e[34m\]\w\[\e[m\]\$ "
alias ll='ls -al'
alias gs='git status'
alias gd='git diff'
alias gcp='git cherry-pick'
export EDITOR=vim
export LANG=en_US.UTF-8
EOF

# 3. 소유권 변경
chown $TARGET_USER:$TARGET_USER "$TARGET_HOME/.bashrc"

echo "Successfully configured .bashrc for $TARGET_USER"
