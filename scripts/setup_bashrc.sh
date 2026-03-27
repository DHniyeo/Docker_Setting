#!/bin/bash
TARGET_USER=$1
TARGET_HOME="/home/$TARGET_USER"

if [ ! -f "$TARGET_HOME/.bashrc" ]; then
    touch "$TARGET_HOME/.bashrc"
fi

cat << 'EOF' >> "$TARGET_HOME/.bashrc"

# --- Docker Environment ---
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH
export EDITOR=vim
export LANG=en_US.UTF-8

# 하늘색 팔레트
_C='\e[38;5;117m'   # 하늘색 (밝음)
_B='\e[38;5;75m'    # 파란 하늘
_D='\e[38;5;67m'    # 딤한 파랑
_R='\e[0m'

# 고래 배너
echo -e "${_C}"
cat << 'WHALE'
    ##         .
## ## ##       ==     ______            _
## ## ## ##   ===    |  __  \          | |
/"""""""""""\_/ ===  | |  | | ___   ___| | _____ _ __
{          /         | |  | |/ _ \ / __| |/ / _ \ '__|
 \_______/           | |__| | (_) | (__|   <  __/ |
  ~~~~~~~            |_____/ \___/ \___|_|\_\___|_|
WHALE
echo -e "${_D}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${_R}"
echo -e "${_C} User  ${_D}│${_R} $(whoami)"
echo -e "${_C} Image ${_D}│${_R} $(hostname)"
echo -e "${_C} Host  ${_D}│${_R} $(uname -o) $(uname -r | cut -d- -f1)"
echo -e "${_D}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${_R}"

# 프롬프트
parse_git_branch() {
    git branch 2>/dev/null | grep '*' | sed 's/* //'
}
export PS1="\[\e[38;5;117m\]🐳\[\e[0m\] \[\e[38;5;75m\]\u\[\e[38;5;67m\]@\[\e[38;5;75m\]\h\[\e[38;5;67m\]:\[\e[38;5;117m\]\w\[\e[38;5;214m\]\$(parse_git_branch | sed 's/.*/ (&)/')\[\e[0m\] \$ "

alias ll='ls -al --color=auto'
alias gs='git status'
alias gd='git diff'
alias gcp='git cherry-pick'
EOF

chown $TARGET_USER:$TARGET_USER "$TARGET_HOME/.bashrc"
echo "Successfully configured .bashrc for $TARGET_USER"