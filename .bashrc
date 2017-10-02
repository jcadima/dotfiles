# CUSTOM STUFF

# some more aliases
alias ut='tar -zxvf' # untar
alias t='tar -cvf' # to compress files: t file-$(date +%F).tar 
alias tsee='tar -tvf'
alias off="sudo shutdown -h now"
alias restart="sudo reboot"
alias x='exit'
alias remove='sudo apt-get remove'
alias cls='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias systeminfo='/usr/sbin/system_profiler SPHardwareDataType'
# if  site allows indexing, download all images into the current directory
alias allimages='wget -r --no-parent http://targetsite.com/images/'


# Directories shortcuts
alias docs='cd ~/Documents;ls -l'
alias downs='cd  ~/Downloads;ls -l'
alias www='cd /Applications/XAMPP/xamppfiles/htdocs;ls -l'
alias pics='cd ~/Pictures ls -l'

# Git
alias gs='git status'
alias pushgit='git push -u origin master'

# Use human-readable filesizes
alias du="du -h"
alias df="df -h" 

# open with sublime
alias editvhosts='sudo sublime /Applications/XAMPP/xamppfiles/etc/extra/httpd-vhosts.conf'
alias edithosts='sudo sublime /etc/hosts' 

# Laravel
alias tinker='artisan tinker'
alias migrate="php artisan migrate"

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
##################################################
#    ___                  _   _                  #
#   / __\_   _ _ __   ___| |_(_) ___  _ __  ___  #
#  / _\ | | | | '_ \ / __| __| |/ _ \| '_ \/ __| #
# / /   | |_| | | | | (__| |_| | (_) | | | \__ \ #
# \/     \__,_|_| |_|\___|\__|_|\___/|_| |_|___/ #
##################################################
# edit bashrc
function ebash () {
    sublime /Users/armadillo/.bashrc
}

# source bashrc
function sbash () {
    source ~/.bashrc
}

#  New laravel project
function laraproject() {
    composer create-project laravel/laravel $1 --prefer-dist
}

# display your public IPv4
function myip() {
    myip="$(dig +short myip.opendns.com @resolver1.opendns.com)"
    echo "Your Public IP: ${myip}"
}

# Install latest wordpress on htdocs
function installwp () {
    echo "###### Creating subdirectory $1 ... in /opt/lampp/htdocs/ ######"

    sudo mkdir /opt/lampp/htdocs/$1
    sudo chmod 777 -R /opt/lampp/htdocs
    if [ -d /opt/lampp/htdocs/$1 ]; then
        cd /opt/lampp/htdocs/$1
        echo "###### Downloading latest Wordpress ... ######"
        wget http://wordpress.org/latest.tar.gz
        echo "###### Extracting Wordpress archive ... ######"
        tar xfz latest.tar.gz

        mv wordpress/* ./
        echo "###### /opt/lampp/htdocs/$1  successfully created #####"
    else 
        echo "###### /opt/lampp/htdocs/$1  could not be created #####"
    fi

}


