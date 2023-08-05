###################################
#   _   _    _   _   __  ___  __  #
#  / \ | |  | | / \ / _|| __|/ _| #
# | o || |_ | || o |\_ \| _| \_ \ #
# |_n_||___||_||_n_||__/|___||__/ #
#         #
###################################
# NOTE: install exa to replace "ls"
alias cls="clear"
alias x="exit"
alias ..="cd ..;exa -al"
alias ...="cd ../..;exa -al"
alias ehost='sudo vim /etc/hosts'
alias eyaml='vim ~/Homestead/Homestead.yaml'
alias ezsh='vim ~/.zshrc'
alias www='cd ~/www;exa -al'
alias code='cd ~/code;exa -al'
alias szsh='source ~/.zshrc'
alias docs='cd ~/Documents;exa -al'
alias downs='cd ~/Downloads;exa -al'
alias pics='cd ~/Pictures;exa -al'
alias vids='cd ~/Videos;exa -al'
alias myip="curl http://ipecho.net/plain; echo"
alias envim='vim ~/.config/nvim/init.vim'
alias nv='nvim'

# DOCKER
alias dlist='docker container ls -a -s'
alias dstopall='docker container kill $(docker ps -q)' # stop all containers
alias dcb="docker compose build"
alias dcu="docker compose up -d"
alias dcbu="docker compose up -d --build" # docker build+up
alias dps="docker ps -a"
alias dstop="docker compose stop"
alias dstart="docker compose start"
alias dcontainers='docker container ls -a'
alias dimages="docker image ls"


# Git
alias gs="git status"
alias ga='git add .'
alias gp="git push -u origin master"

# Human readable filesize
alias du="du -h"
alias df="df -h"


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


