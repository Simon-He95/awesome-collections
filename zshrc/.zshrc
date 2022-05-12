# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-nvm zsh-z web-search)

source $ZSH/oh-my-zsh.sh
source ~/.bash_profile
# User configuration
# -------------------------#
#  Node Package Manager
# -------------------------#
# alias - ni

alias nio="ni --prefer-offline"
alias d="nr dev"
alias s="nr start"
alias b="nr build"
alias bw="nr build --watch"
alias t="nr test"
alias t="nr test -u"
alias w="nr watch"
alias lint="nr lint"
alias lintf="nr lint --fix"
alias s="nr start"
alias p="nr play"
alias pr="nr preview"
alias pb="nr play:build"
alias updateVersion="git add . && git commit -m 'chore: update version' && git push"
alias clean="git add . && git commit -m 'chore: clean' && git push"
alias v="npm view"
alias init="npm init -y"

#--------------------------#
# project simple
# -------------------------#

alias cls="clear"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias remove="rimraf"

#--------------------------#
# Git
# -------------------------#

alias gs="git status"
alias gcc="git checkout"
alias gccb="git checkout -b"
alias gl="git log"
alias glo="git log --online --graph"
alias gb="git branch"
alias gba="git branch -a"
alias gc="git add . && git commit -m"
alias ga="git add ."
alias gs="git status"
alias gpl="git pull --rebase"
alias gpf="git push --force"
alias gcl="git clone"
alias gp="git push"
alias gst="git stash"
alias rebase="git rebase"
alias reset="git reset HEAD"
alias reset1="git reset HEAD~1"
alias main="git checkout main"
alias use="nrm use"
alias template="npx degit Simon-He95/vitesse-lite"
alias unproxy="git config --global --unset http.proxy && git config --global --unset https.proxy"
alias pullmaster="git pull origin master"
alias pullmain="git pull origin main"
alias flog="git reflog"
alias see="ps -ef|grep"

#--------------------------#
# Pnpm
# -------------------------#

run() {
  command="$2"

  if [ "$2" = "" ]; then
    pnpm run $1
    return
  elif [ "$2" = "i" -o "$2" = "install" ]; then
    data=$*
    len1=$1
    len2=$2
    result="pnpm --filter "$1" i ${data:$(expr ${#len1} + ${#len2} + 2)}"
    eval $result
    return
  elif [ "$2" = "un" -o "$2" = "uninstall" ]; then
    data=$*
    len1=$1
    len2=$2
    result="pnpm --filter "$1" uninstall ${data:$(expr ${#len1} + ${#len2} + 2)}"
    eval $result
    return
  elif [ "$2" = "d" ]; then
    command="dev"
  elif [ "$2" = "b" ]; then
    command="build"
  elif [ "$2" = "t" ]; then
    command="test"
  elif [ "$2" = "p" ]; then
    command="playground"
  elif [ "$2" = "pr" ]; then
    command="preview"
  fi
  pnpm --filter $1 run $command
}

#创建git tag
tag() {
  echo "请输入tagname:"
  read tagname
  if [ "$tagname" = "" ]; then
    echo "输入的tagname为空"
    exit 1
  fi

  echo "请输入描述:"

  read detail
  if [ -n "detail" ]; then
    detail="say nothing"
  fi
  if [ "$?" = 0 ]; then
    git tag -a $tagname -m $detail
  fi
}

fpath=($fpath "/home/simon/.zfunctions")

# Set Spaceship ZSH as a prompt
autoload -U promptinit
promptinit
prompt spaceship

export PNPM_HOME="/home/simon/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
