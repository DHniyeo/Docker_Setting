#!/bin/bash
# setup_bashrc.sh

TARGET_USER=$1
TARGET_HOME="/home/$TARGET_USER"

echo "Configuring .bashrc for user: $TARGET_USER"

if [ ! -f "$TARGET_HOME/.bashrc" ]; then
    touch "$TARGET_HOME/.bashrc"
fi

# heredoc으로 .bashrc에 내용 추가
cat << 'EOF' >> "$TARGET_HOME/.bashrc"

# --- Docker Environment Customization ---
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH
export PS1="\[\e[31m\][DOCKER]\[\e[m\] \[\e[32m\]\u@\h:\[\e[34m\]\w\[\e[m\]\$ "
alias ll='ls -al'
alias gs='git status'
alias gd='git diff'
alias gcp='git cherry-pick'
export EDITOR=vim
export LANG=en_US.UTF-8
EOF

chown $TARGET_USER:$TARGET_USER "$TARGET_HOME/.bashrc"

echo "Successfully configured .bashrc for $TARGET_USER"