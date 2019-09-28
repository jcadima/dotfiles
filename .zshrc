# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh


ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'

# Prompts
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon ssh context dir virtualenv vcs)
else
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon user dir virtualenv vcs)
fi

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator custom_now_playing time)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_DELIMITER=..
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B4'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B6'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="╭"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="╰\uF460\uF460\uF460 "


# Colors
POWERLEVEL9K_VIRTUALENV_BACKGROUND=107
POWERLEVEL9K_VIRTUALENV_FOREGROUND='white'
POWERLEVEL9K_CUSTOM_NOW_PLAYING_BACKGROUND='blue'
POWERLEVEL9K_CUSTOM_NOW_PLAYING_FOREGROUND='black'
POWERLEVEL9K_OS_ICON_BACKGROUND='white'
POWERLEVEL9K_OS_ICON_FOREGROUND='black'
POWERLEVEL9K_TIME_BACKGROUND='white'
POWERLEVEL9K_TIME_FOREGROUND='black'


# VCS colors
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='cyan'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='white'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='cyan'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'

# comma separated plugins here, the more you add, the slower it becomes
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration
alias cls="clear"
alias x="exit"
alias ..="cd .."
alias ...='cd ../..'
alias myip="curl http://ipecho.net/plain; echo"
alias ezsh='vim ~/.zshrc'
alias szsh='source ~/.zshrc'
alias ehost='sudo vim /etc/hosts'
alias checktemp='sudo tlp-stat | grep -i "CPU temp"' # check CPU temperature with tlp


alias docs='cd ~/Documents;ls -l'
alias downs='cd ~/Downloads;ls -l'
alias pics='cd ~/Pictures;ls -l'
alias vids='cd ~/Videos;ls -l'

# Git
alias gs="git status"
alias ga="git add ."
alias gp="git push -u origin master"

# Human readable filesize
alias du="du -h"
alias df="df -h"


# Vagrant, Assumes Homestead directory is located in home directory 
alias vu='cd ~/Homestead;vagrant up'
alias vh='cd ~/Homestead;vagrant halt'
alias vp='cd ~/Homestead;vagrant provision'
alias vr='cd ~/Homestead;vagrant reload'
alias vs='cd ~/Homestead;vagrant ssh'