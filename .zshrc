#      _  ____ 
#     | |/ ___|		
#  _  | | |    		Juan J Cadima
# | |_| | |___ 		https://github.com/jcadima
#  \___/ \____|	  https://jcadima.dev

############################################
#  ___  __  _ _    __ _  _  _  ___  _  __  #
# |_ / / _|| U |  / _/ \| \| || __|| |/ _| #
#  /(_ \_ \|   | ( (( o ) \\ || _| | ( |_n #
# /___||__/|_n_|  \__\_/|_|\_||_|  |_|\__/ #
#					                       #
############################################

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context ssh virtualenv os_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator history time)

POWERLEVEL9K_OS_ICON_FOREGROUND=000
POWERLEVEL9K_OS_ICON_BACKGROUND=002
POWERLEVEL9K_USER_DEFAULT_FOREGROUND=000
POWERLEVEL9K_USER_DEFAULT_BACKGROUND=002
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=004
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=007
POWERLEVEL9K_DIR_HOME_BACKGROUND=004
POWERLEVEL9K_DIR_HOME_FOREGROUND=007
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=004
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
#				                  #
###################################
alias cls="clear"
alias x="exit"
alias ..='cd ..;ls -al'
alias ...='cd ../..;ls -al'
alias ehost='sudo vim /etc/hosts'
alias eyaml='vim ~/Homestead/Homestead.yaml'
alias ezsh='vim ~/.zshrc'
alias szsh='source ~/.zshrc'
alias docs='cd ~/Documents; ls -al'
alias downs='cd ~/Downloads; ls -al'
alias pics='cd ~/Pictures; ls -al'
alias vids='cd ~/Videos; ls -al'
alias myip="curl http://ipecho.net/plain; echo"
alias www='cd ~/www;ls -l'

# Git
alias gs="git status"
alias ga="git add ."

# Human readable filesize
alias du="du -h"
alias df="df -h"

# HOMESTEAD/VAGRANT
alias vu='cd ~/Homestead && vagrant up && cd -'
alias vh='cd ~/Homestead && vagrant halt && cd -'
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
