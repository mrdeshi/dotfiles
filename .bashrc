#
# ~/.bashrc
#
#    _               _              
#   | |__   __ _ ___| |__  _ __ ___ 
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__ 
# (_)_.__/ \__,_|___/_| |_|_|  \___|
# 

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

# -----------------------------------------------------
# LOAD CUSTOM .bashrc_custom if exists
# -----------------------------------------------------
if [ -f ~/.bashrc_custom ] ;then
    source ~/.bashrc_custom
fi

# -----------------------------------------------------
# Fastfetch if in Hyprland
# -----------------------------------------------------
if [[ $(tty) == *"pts"* ]]; then
    fastfetch
else
    echo
    echo "Start Hyprland with command Hyprland"
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '




[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
