# CUSTOM STUFF

# some more aliases
alias ut='tar -zxvf' # untar
alias t='tar -cvf' # to compress files: t file-$(date +%F).tar 
alias tsee='tar -tvf'
alias x='exit'
alias cls='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ebash='vim ~/.bashrc'
alias sbash='source ~/.bashrc'
alias myip="curl http://ipecho.net/plain; echo"
alias checktemp='sudo tlp-stat | grep -i "CPU temp"' # check CPU temperature with tlp
alias systeminfo='/usr/sbin/system_profiler SPHardwareDataType'

# Directories shortcuts
alias docs='cd ~/Documents;ls -l'
alias downs='cd ~/Downloads;ls -l'
alias pics='cd ~/Pictures;ls -l'
alias vids='cd ~/Videos;ls -l'

# Git
alias gs="git status"
alias ga="git add ."
alias gp="git push -u origin master"

# Use human-readable filesizes
alias du="du -h"
alias df="df -h" 

# open hosts with vim
alias ehost='sudo vim /etc/hosts' 


# System
alias top6='ps aux | sort -rk 3,3 | head -n 6' # top 6 cpu processes


#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls)
#-------------------------------------------------------------
alias l='ls'
alias ll="ls -l"
alias ls='ls -hF'  # add colors for filetype recognition
alias la='ls -Al'          # show hidden files
alias lext='ls -lXB'         # sort by extension
alias lsize='ls -lSr'         # sort by size, biggest last
alias lchange='ls -ltcr'        # sort by and show change time, most recent last
alias laccess='ls -ltur'        # sort by and show access time, most recent last
alias ldate='ls -ltr'         # sort by date, most recent last
alias lmore='ls -al |more'    # pipe through 'more'
alias lr='ls -lR'          # recursive ls
alias tree='tree -Csu'     # nice alternative to 'recursive ls'


############################################################
#  _____ _              ___                           _    #
# /__   \ |__   ___    / _ \_ __ ___  _ __ ___  _ __ | |_  #
#   / /\/ '_ \ / _ \  / /_)/ '__/ _ \| '_ ` _ \| '_ \| __| #
#  / /  | | | |  __/ / ___/| | | (_) | | | | | | |_) | |_  #
#  \/   |_| |_|\___| \/    |_|  \___/|_| |_| |_| .__/ \__| #
#                                              |_|         #
############################################################    

# Greeting, motd etc...
#-------------------------------------------------------------
# Define some colors first:
LIGHTGRAY='\e[0;37m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
red='\e[0;31m'
RED='\e[1;31m'
blue='\e[0;34m'
BLUE='\e[1;34m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NORMAL='\[\033[00m\]'
NC='\e[0m'              # No Color
PS1="$RED[ $LIGHTCYAN\u$LIGHTBLUE @ $LIGHTGREEN\h $RED]  $LIGHTGREEN=>  $LIGHTBLUE\w $LIGHTGREEN \n > $NORMAL "
