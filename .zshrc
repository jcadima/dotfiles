# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).

# zstyle ':omz:update' frequency 13
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


###################################
#   _   _    _   _   __  ___  __  #
#  / \ | |  | | / \ / _|| __|/ _| #
# | o || |_ | || o |\_ \| _| \_ \ #
# |_n_||___||_||_n_||__/|___||__/ #
#         #
###################################
# NOTE: install exa to replace "ls"
alias x="exit"
alias ..="cd ..;ls -al"
alias ...="cd ../..;ls -al"
# alias cat='batcat'  # apt install bat, executable: /usr/bin/batcat
alias ehost='sudo nvim /etc/hosts'
alias econfig='nvim ~/.ssh/config'
alias eyaml='nvim ~/Homestead/Homestead.yaml'
alias ezsh='nvim ~/.zshrc'
alias www='cd ~/www;ls -al'
alias szsh='source ~/.zshrc'
alias docs='cd ~/Documents;ls -al'
alias downs='cd ~/Downloads;ls -al'
alias pics='cd ~/Pictures;ls -al'
alias vids='cd ~/Videos;ls -al'
alias myip="curl https://whatismyip.akamai.com; echo"
alias nv='nvim'
alias zz='sudo systemctl suspend'
alias off='sudo poweroff'

# DOCKER
alias dlist='docker container ls -a -s'
alias dstopall='docker container kill $(docker ps -q)' # stop all containers
alias dcb="docker compose build"
alias dcu="docker compose up -d"
alias dcbu="docker compose up -d --build" # docker build+up
alias dps="docker ps -a"
alias dstop="docker compose stop"
alias dstart="docker compose start"
alias dcontainers='docker ps --format "{{.Names}}"'
alias dimages="docker image ls"


# Git
alias gs="git status"
alias ga='git add .'
alias gp="git push -u origin master"
alias gl='git log --oneline --graph --decorate --all'

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
# sublist3r subdomain scanner
function scandomain() {
    sublist3r -d $1
}


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

# $1: Database HOST 
# $2: Database NAME
function dmysql() {
  docker exec -it $1 mysql -u $2 -p
}

function dbash() {
  docker exec -it $1 bash
}

export EDITOR=vim
export VISUAL=vim
export PATH="$HOME/.npm-global/bin:$PATH"
#export PATH="$HOME/neovim/build/bin/nvim:$PATH"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
