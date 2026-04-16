#
# ~/.bashrc
#
#    _               _              
#   | |__   __ _ ___| |__  _ __ ___ 
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__ 
# (_)_.__/ \__,_|___/_| |_|_|  \___|
# 


#PYWAL
(cat ~/.cache/wal/sequences &)

# -----------------------------------------------------
# Fastfetch if in Hyprland
# -----------------------------------------------------
if [[ $(tty) == *"pts"* ]]; then
    fastfetch
else
    echo
    echo "Welcome back deshi!"
    echo
fi


# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

# -----------------------------------------------------
# LOAD CUSTOM .bashrc_custom if exists
# -----------------------------------------------------
if [ -f ~/.bashrc_custom ] ;then
    source ~/.bashrc_custom
fi


alias bt='echo "basco termopili!";echo;sleep 2; shutdown -h now'
alias bt?='shutdown --show'
alias btbt='reboot'


#conda alias
alias anaconda='source ~/conda.bashrc'


#computer graphics
export MESA_VK_WSI_PRESENT_MODE=immediate
export MESA_NO_VSYNC=1


#miniconda vscontainer
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
