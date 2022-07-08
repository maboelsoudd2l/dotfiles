#                 ██      
#                ░██      
#  ██████  ██████░██      
# ░░░░██  ██░░░░ ░██████  
#    ██  ░░█████ ░██░░░██ 
#   ██    ░░░░░██░██  ░██ 
#  ██████ ██████ ░██  ░██ 
# ░░░░░░ ░░░░░░  ░░   ░░  
#
#  ▓▓▓▓▓▓▓▓▓▓
# ░▓ author ▓ xero <x@xero.nu>
# ░▓ code   ▓ http://code.xero.nu/dotfiles
# ░▓ mirror ▓ http://git.io/.files
# ░▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░
#
#█▓▒░ aliases
alias xyzzy="echo nothing happens"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"
alias dev="cd ~/Dev/"

# colorflag="-G"
colorflag="--color"
# export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
# List all files colorized in long format
alias l="gls -lhF ${colorflag}"

# List all files colorized in long format, excluding . and ..
alias la="gls -lAhF ${colorflag}"

# List only directories
alias lsd="gls -lhF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
# alias ls="command ls ${colorflag}"

alias ls="gls -hF --color=auto"
alias ll="gls -lahF --color=auto"
alias lsl="gls -lhF --color=auto"
alias "cd.."="cd ../"
alias up="cd ../"
alias rmrf="rm -rf"
alias psef="ps -ef"
alias mkdir="mkdir -p"
alias grep="grep -i"
alias cp="cp -r"
alias scp="scp -r"
alias xsel="xsel -b"
alias fuck='sudo $(fc -ln -1)'
alias e="$EDITOR"
alias se="sudo $EDITOR"
alias v="nvim"
alias vimdiff="nvim -d -u ~/.vimrc"
alias emacs="nvim"
alias vim="nvim"
alias g="git"
alias ga="git add"
alias gc="git commit -m"
alias gs="git status"
alias gd="git diff"
alias gf="git fetch"
alias gm="git merge"
alias gr="git rebase"
alias gp="git push"
alias gu="git unstage"
alias gg="git graph"
alias ggg="git graphgpg"
alias gco="git checkout"
alias gcs="git commit -S -m"
alias gpr="hub pull-request"
alias ag="ag --color --color-line-number '0;35' --color-match '46;30' --color-path '4;36'"
alias tree='tree -CAFa -I "CVS|*.*.package|.svn|.git|.hg|node_modules|bower_components" --dirsfirst'
alias rock="ncmpcpp"
alias mixer="alsamixer"
alias matrix="cmatrix -b"
alias tempwatch="while :; do sensors; sleep 1 && clear; done;"
alias term="urxvtc -hold -e " #used for run menu
alias toiletlist='for i in ${TOILET_FONT_PATH:=/usr/share/figlet}/*.{t,f}lf; do j=${i##*/}; echo ""; echo "╓───── "$j; echo "╙────────────────────────────────────── ─ ─ "; echo ""; toilet -d "${i%/*}" -f "$j" "${j%.*}"; done'
alias tdlist='for i in ${TD_FONT_PATH:=/usr/local/share/tdfiglet/fonts}/*.tdf; do j=${i##*/}; echo ""; echo "╓───── "$j; echo "╙────────────────────────────────────── ─ ─ "; echo ""; tdfiglet -f "$j" "${j%.*}"; done'
alias ascii="toilet -t -f 3d"
alias future="toilet -t -f future"
alias rusto="toilet -t -f rusto"
alias rustofat="toilet -t -f rustofat"
alias lol="base64 </dev/urandom | lolcat"
alias pacman="sudo pacman"
alias update="pacman-colors && yay -Syu"
alias systemctl="sudo systemctl"
alias :q="sudo systemctl poweroff"
alias ZZ="exit"
alias disks='echo "╓───── m o u n t . p o i n t s"; echo "╙────────────────────────────────────── ─ ─ "; lsblk -a; echo ""; echo "╓───── d i s k . u s a g e"; echo "╙────────────────────────────────────── ─ ─ "; df -h;'
alias todo="bash ~/code/sys/todo"
alias record="ffmpeg -f x11grab -s 1366x768 -an -r 16 -loglevel quiet -i :0.0 -b:v 5M -y" #pass a filename
alias nexus="jmtpfs ~/nexus"
alias p="pass -c"
alias doc="sudo docker"
#alias docclean="sudo docker rm $(sudo docker ps -a -q) &&  sudo docker rmi $(sudo docker images -q)"
alias docstats="sudo docker ps -q | xargs  docker stats --no-stream"

#█▓▒░ Mohameds stuff
# python stuff
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
# away from keyboard
alias afk="pmset displaysleepnow"
# npm stuff
alias npmci='rm package-lock.json; rm -rf node_modules;  npm install'
# used to run polymer on the local network, use this better than "polymer serve"
alias polyserve='node_modules/.bin/polymer serve --hostname KLM0-MABOELSOUD'
# git stuff
alias gacm='git add --all; git commit -m $1'
function gacmp() { git add --all; git commit -m "$1"; git push; }
alias dotnet='~/.dotnet/dotnet'

#█▓▒░ update mpd database
function genplaylist() {
  cd ~/music
  find . -name '*.mp3' -o -name '*.flac'|sed -e 's%^./%%g' > ~/.config/mpd/playlists/all.m3u
  mpc clear
  mpc load all.m3u
  mpc update
}
#█▓▒░ tmux
function t() {
  X=$#
  [[ $X -eq 0 ]] || X=X
  tmux new-session -A -s $X
}
#█▓▒░ cli mail
function email() {
	echo $3 | mutt -s $2 $1
}
#█▓▒░ read stuff like manpages
function md() {
    pandoc -s -f markdown -t man "$*" | man -l -
}
function manwww() {
	curl -skL "$*" | pandoc -s -f html -t man | man -l -
}
#█▓▒░ nullpointer url shortener
function short() {
  curl -F"shorten=$*" https://0x0.st
}
#█▓▒░ smaller scrots
function scrot_area() {
  read -r G < <(slop -f "%g")
  import -window root -crop $G ~/$(date "+%Y-%m-%d_%H-%M-%S")_slop_scrot.png
}
#█▓▒░ record video
function vid_area() {
  read -r X Y W H G ID < <(slop -f "%x %y %w %h %g %i")
  ffmpeg -f x11grab -s "$W"x"$H" -i :0.0+$X,$Y -f alsa -i pulse ~/$(date "+%Y-%m-%d_%H-%M-%S")_slop_vid.webm
}


#█▓▒░ Mohameds stuff

#█▓▒░ used to bump the dependabot stuff in luna
#█▓▒░ getNpmVersion is a dependency of versionBumpMaster
function getNpmVersion() {
cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]'
}

function versionBumpMaster() {
if [ $# -eq 0 ]
  then
    echo "please enter branch name"
  else
    if [ "$1" == "-p" ]; then
      DOPUSH=true
      shift
    else
      DOPUSH=false
    fi
    TARGETBRANCH=$1  && \
    git checkout master  && \
    git fetch --all  && \
    git pull  && \
    MASTERVERSION=$(getNpmVersion)  && \
    git checkout $TARGETBRANCH  && \
    npm version --allow-same-version $MASTERVERSION  && \
    NEWVERSION=$(npm version patch)  && \
    git add --all  && \
    git commit -m "$NEWVERSION";
    if [ $DOPUSH = true ]; then 
      git push;
    fi
fi    
}


#█▓▒░ bmx stuff
function setAWSProfile() {
  if [ ! $1 ]
  then
    echo "ERROR: Missing AWS Account Name"
    return
  fi

  account=$1

  if [ ! $2 ]
  then
    role="User"
    echo "WARNING: AWS Account Role not specified."
    echo "Using 'User' as default AWS Account Role."
    echo
  else
    role=$2
  fi

  if ! type "bmx" > /dev/null
  then
    echo "ERROR: The 'bmx' command is not in your environment PATH."
    echo "Please add 'bmx' to your PATH."
    echo "NOTE: You may have to rename the cmdlet to 'bmx' rather than using the default name (i.e. bmx_darwin_amd64)."
    return
  fi

  awsConfigFolder="$HOME/.aws"
  if [ ! -d "$awsConfigFolder" ]
  then
    mkdir $awsConfigFolder
  fi

  bmxConfigFolder="$HOME/.bmx"
  if [ ! -d "$bmxConfigFolder" ]
  then
    mkdir $bmxConfigFolder
  fi

  bmxConfigFile="$bmxConfigFolder/config"
  if [ ! -f "$bmxConfigFile" ]
  then
    echo "Enter your username (email used in AWS):"
    read username
    echo "user=$username" > $bmxConfigFile
    echo "Username saved in $bmxConfigFile"
    echo "NOTE: You will not be prompted for username again."
    echo
  else
    echo "Using the following config ($bmxConfigFile):"
    cat $bmxConfigFile
    echo
  fi

  echo "Using AWS Account: $account"
  echo "Using AWS Role: $role"
  echo

  bmx write --org d2l --account $account --role $account-$role --profile $account
  export AWS_PROFILE=$account
}

# i hate this
alias x="startx"
