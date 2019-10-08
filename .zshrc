############################################
#  ___  __  _ _    __ _  _  _  ___  _  __  #
# |_ / / _|| U |  / _/ \| \| || __|| |/ _| #
#  /(_ \_ \|   | ( (( o ) \\ || _| | ( |_n #
# /___||__/|_n_|  \__\_/|_|\_||_|  |_|\__/ #
#										   #
############################################

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
#  export ZSH=/home/user/.oh-my-zsh
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'


POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh virtualenv os_icon dir vcs time status)

POWERLEVEL9K_DISABLE_RPROMPT=true

POWERLEVEL9K_OS_ICON_FOREGROUND=000
POWERLEVEL9K_OS_ICON_BACKGROUND=002
POWERLEVEL9K_USER_DEFAULT_FOREGROUND=000
POWERLEVEL9K_USER_DEFAULT_BACKGROUND=002
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=004
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=007
POWERLEVEL9K_DIR_HOME_BACKGROUND=004
POWERLEVEL9K_DIR_HOME_FOREGROUND=007
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=004  # other dictories, 004=blue.
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=007
POWERLEVEL9K_VIRTUALENV_BACKGROUND=008
POWERLEVEL9K_VIRTUALENV_FOREGROUND=011

POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_RAM_ICON=''
POWERLEVEL9K_PROMPT_ON_NEWLINE=true


plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

###################################
#   _   _    _   _   __  ___  __  #
#  / \ | |  | | / \ / _|| __|/ _| #
# | o || |_ | || o |\_ \| _| \_ \ #
# |_n_||___||_||_n_||__/|___||__/ #
#								  #
###################################
alias cls="clear"
alias x="exit"
alias ..="cd .."
alias ehost='sudo -S subl /etc/hosts'
alias eyaml='subl ~/Homestead/Homestead.yaml' # assumes sublime text is installed
alias ezsh='subl ~/.zshrc'
alias www='cd ~/www;ls -l'
alias szsh='source ~/.zshrc'
alias docs='cd ~/Documents;ls -l'
alias downs='cd ~/Downloads;ls -l'
alias pics='cd ~/Pictures;ls -l'
alias vids='cd ~/Videos;ls -l'
alias checktemp='sudo tlp-stat | grep -i "CPU temp"' # grep CPU temp with TLP
alias myip="curl http://ipecho.net/plain; echo"

# Git
alias gs="git status"
alias ga="git add ."
alias pushgit="git push -u origin master"

# Human readable filesize
alias du="du -h"
alias df="df -h"


#############################################
#  ___  _ _  _  _  __  ___  _  _  _  _  __  #
# | __|| | || \| |/ _||_ _|| |/ \| \| |/ _| #
# | _| | U || \\ ( (_  | | | ( o ) \\ |\_ \ #
# |_|  |___||_|\_|\__| |_| |_|\_/|_|\_||__/ #
#                                           #
#############################################

# Vagrant, Assumes Homestead directory is located in home directory 
# v up        = vagrant up
# v halt      = vagrant halt
# v provision = vagrant provision
# v reload    = vagrant reload
# v ssh       = vagrant ssh

# this will let you run any Vagrant command from anywhere on your system
function v() {
    ( cd ~/Homestead && vagrant $* && cd -)
}