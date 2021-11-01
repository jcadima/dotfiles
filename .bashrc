#	Juan J Cadima
# 	https://github.com/jcadima
#	https://jcadima.dev

######################################
#    _   _    ___   _   ___ ___ ___  #
#   /_\ | |  |_ _| /_\ / __| __/ __| #
#  / _ \| |__ | | / _ \\__ \ _|\__ \ #
# /_/ \_\____|___/_/ \_\___/___|___/ #
######################################                                   

alias x='exit'
alias ..='cd ..;ls -al'
alias ...='cd ../..;ls -al'
alias ebash='vim ~/.bashrc'
alias sbash='source ~/.bashrc'
alias evim='vim ~/.vimrc'
alias eyaml='vim ~/Homestead/Homestead.yaml'
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
alias www='cd ~/www;ls -l'

# HOMESTEAD/VAGRANT
alias vu='cd ~/Homestead && vagrant up && cd -'
alias vh='cd ~/Homestead && vagrant halt && cd -'
alias vp='cd ~/Homestead && vagrant provision && cd -'
alias vr='cd ~/Homestead && vagrant reload && cd -'
alias vs='cd ~/Homestead && vagrant ssh && cd -'

#####################################################
#  _____ _  _ ___   ___ ___  ___  __  __ ___ _____  # 
# |_   _| || | __| | _ \ _ \/ _ \|  \/  | _ \_   _| #
#   | | | __ | _|  |  _/   / (_) | |\/| |  _/ | |   #
#   |_| |_||_|___| |_| |_|_\\___/|_|  |_|_|   |_|   #
#####################################################
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


####################################################
#   ___ ___ _____   ___ ___  ___  __  __ ___ _____ #
#  / __|_ _|_   _| | _ \ _ \/ _ \|  \/  | _ \_   _|#
# | (_ || |  | |   |  _/   / (_) | |\/| |  _/ | |  #
#  \___|___| |_|   |_| |_|_\\___/|_|  |_|_|   |_|  #
####################################################

# git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source $HOME/.bash-git-prompt/gitprompt.sh
fi


#################################################
#  ___ _   _ _  _  ___ _____ ___ ___  _  _ ___  #
# | __| | | | \| |/ __|_   _|_ _/ _ \| \| / __| #
# | _|| |_| | .` | (__  | |  | | (_) | .` \__ \ #
# |_|  \___/|_|\_|\___| |_| |___\___/|_|\_|___/ #
#################################################                                                                                    

# https://philiplb.de/sqldumpsplitter3/
function dbsplit() {
	~/dbsplitter.AppImage
}

# sudo apt-get install exiftool
function findpicgps() {
	exiftool -c '%.6f' -GPSPosition $1
}





