export ZSH=$HOME/.oh-my-zsh
############################################
#  ___  __  _ _    __ _  _  _  ___  _  __  #
# |_ / / _|| U |  / _/ \| \| || __|| |/ _| #
#  /(_ \_ \|   | ( (( o ) \\ || _| | ( |_n #
# /___||__/|_n_|  \__\_/|_|\_||_|  |_|\__/ #
#            #
############################################
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context ssh virtualenv os_icon dir vcs time status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()  # right prompt empty
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
#         #
###################################
alias cls="clear"
alias x="exit"
alias ..="cd ..;ls -al"
alias ...="cd ../..;ls -al"
alias ehost='sudo vim /etc/hosts'
alias eyaml='vim ~/Homestead/Homestead.yaml'
alias ezsh='vim ~/.zshrc'
alias www='cd ~/www;ls -al'
alias szsh='source ~/.zshrc'
alias docs='cd ~/Documents;ls -al'
alias downs='cd ~/Downloads;ls -al'
alias pics='cd ~/Pictures;ls -al'
alias vids='cd ~/Videos;ls -al'
alias myip="curl http://ipecho.net/plain; echo"
alias evim='vim ~/.vimrc'
alias svim='source ~/.vimrc'

alias dcb="docker-compose build"
alias dcu="docker-compose up -d"
alias dcbu="docker-compose up -d --build"
alias dps="docker ps -a"
alias dstop="docker-compose stop"
alias dstart="docker-compose start"
alias dcontainers='docker container ls -a'
alias dimages="docker image ls"


# Git
alias gs="git status"
alias ga='git add .'
alias gp="git push -u origin master"

# Human readable filesize
alias du="du -h"
alias df="df -h"

# DOCKER
# Run all stopped containers:
alias dlist='docker container ls -a -s'
alias dstopall='docker container kill $(docker ps -q)'


# HOMESTEAD/VAGRANT
alias vu='cd ~/Homestead && vagrant up && cd -'
alias vh='cd ~/Homestead && vagrant halt --force && cd -'
alias vp='cd ~/Homestead && vagrant provision && cd -'
alias vr='cd ~/Homestead && vagrant reload && cd -'
alias vs='cd ~/Homestead && vagrant ssh && cd -'


#############################################
#  ___  _ _  _  _  __  ___  _  _  _  _  __  #
# | __|| | || \| |/ _||_ _|| |/ \| \| |/ _| #
# | _| | U || \\ ( (_  | | | ( o ) \\ |\_ \ #
# |_|  |___||_|\_|\__| |_| |_|\_/|_|\_||__/ #
#                                           # 
#############################################

# Git log find by commit message
function glf() { git log --all --grep="$1"; }


# Docker shortcuts
function dinspect() {
  docker inspect $1 | grep Status
}


function dlogs() {
  docker logs -f $1
}


function dnetwork() {
  docker inspect $1 | grep IP
}

function dmysql() {
  docker exec -it $1 mysql -u $2 -p
}

function dbash() {
  docker exec -it $1 bash
}


