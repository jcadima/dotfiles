#      _  ____ 
#     | |/ ___|		
#  _  | | |    		Juan J Cadima
# | |_| | |___ 		https://github.com/jcadima
#  \___/ \____|	  https://jcadima.dev


###################################
#   _   _    _   _   __  ___  __  #
#  / \ | |  | | / \ / _|| __|/ _| #
# | o || |_ | || o |\_ \| _| \_ \ #
# |_n_||___||_||_n_||__/|___||__/ #
#								                  #
###################################
alias x='exit'
alias cls='clear'
alias ..='cd ..;ls -al'
alias ...='cd ../..;ls     -al'
alias ebash='vim ~/.bashrc'
alias sbash='source ~/.bashrc'
alias evim='vim ~/.vimrc'
alias svim='source ~/.vimrc'
alias myip="curl http://ipecho.net/plain; echo"

# Directories shortcuts
alias docs='cd ~/Documents; ls -al'
alias downs='cd ~/Downloads; ls -al'
alias pics='cd ~/Pictures; ls -al'
alias vids='cd ~/Videos; ls -al'

# Git
alias gs="git status"
alias ga="git add ."

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


# HOMESTEAD/VAGRANT
alias vu='cd ~/Homestead && vagrant up && cd -'
alias vh='cd ~/Homestead && vagrant halt && cd -'
alias vp='cd ~/Homestead && vagrant provision && cd -'
alias vr='cd ~/Homestead && vagrant reload && cd -'
alias vs='cd ~/Homestead && vagrant ssh && cd -'

################################################
#  ___  _ _  ___   ___ ___  _  _   _  ___ ___  #
# |_ _|| U || __| | o \ o \/ \| \_/ || o \_ _| #
#  | | |   || _|  |  _/   ( o ) \_/ ||  _/| |  #
#  |_| |_n_||___| |_| |_|\\\_/|_| |_||_|  |_|  #
#											                         #
################################################

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


#############################################
#  ___  _ _  _  _  __  ___  _  _  _  _  __  #
# | __|| | || \| |/ _||_ _|| |/ \| \| |/ _| #
# | _| | U || \\ ( (_  | | | ( o ) \\ |\_ \ #
# |_|  |___||_|\_|\__| |_| |_|\_/|_|\_||__/ #
#                                           # 
#############################################

# Extract compressed files,  use:  zipfile.zip
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2|*.tbz2) tar xjf $1   ;;
      *.tar.gz|*.tgz)   tar xzf $1   ;;
      *.bz2)            bunzip2 $1   ;;
      *.rar)            unrar x $1     ;;
      *.gz)             gunzip $1    ;;
      *.tar)            tar xf $1    ;;
      *.zip)            unzip $1     ;;
      *.Z)              uncompress $1;;
      *.7z)             7z x $1      ;;
      *)                echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# list directory contents after directory change, 
# using "to" as function name to avoid collision with vagrant aliases section
# usage:  to directory_name
function to() {
    builtin cd "$@" && ls -al
}
