# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# plugins
plugins=(git zsh-autosuggestions zsh-nvm zsh-z zsh-syntax-highlighting)

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
alias lintf="nr lint:fix"
alias s="nr start"
alias p="nr play || d"
alias pr="nr preview"
alias pb="nr play:build || b"
alias release="npm run release"
alias publish="npm publish"
alias clean="git add . && git commit -m 'chore: clean' && git push"
alias v="npm view"
alias lock="pnpm install --no-frozen-lockfile"

#--------------------------#
# project simple
# -------------------------#

alias cls="clear"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

#--------------------------#
# Git
# -------------------------#

alias gs="git status"
alias gcc="git checkout"
alias gccb="git checkout -b"
alias gl="git log"
alias glo="git log --online --graph"
alias gb="git branch"
alias gbd="git branch -d"
alias gba="git branch -a"
alias gc="git add . && git commit -m"
alias ga="git add ."
alias gs="git status"
alias gpl="git pull --rebase"
alias gpf="git push --force"
alias gpt="git push origin --tags"
alias gptf="git push origin --tags -f"
alias gp="git push"
alias gst="git stash"
alias rebase="git rebase"
alias reset="git reset HEAD"
alias reset1="git reset HEAD~1"
alias main="git checkout main"
alias use="nrm use"
alias unproxy="git config --global --unset http.proxy && git config --global --unset https.proxy"
alias proxy="git config --global http.proxy http://127.0.0.1:57932 && git config --global https.proxy https://127.0.0.1:57932"
alias pullmaster="git pull origin master"
alias pullmain="git pull origin main"
alias flog="git reflog"
alias see="ps -ef|grep"

#--------------------------#
# Pnpm
# -------------------------#

RED='\e[1;31m'     # 红
GREEN='\e[1;32m'   # 绿
YELLOW='\e[1;33m'  # 黄
BLUE='\e[1;34m'    # 蓝
PINK='\e[1;35m'    # 粉红
SKYBLUE='\e[1;96m' # 紫
RES='\e[0m'        # 清除颜色

console.red() {
  echo -e "${RED} $* ${RES}"
}

console.green() {
  echo -e "${GREEN} $* ${RES}"
}

console.yellow() {
  echo -e "${YELLOW} $* ${RES}"
}

console.blue() {
  echo -e "${BLUE} $* ${RES}"
}

console.skyblue() {
  echo -e "${SKYBLUE} $* ${RES}"
}
console.pink() {
  echo -e "${PINK} $* ${RES}"
}

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

# 创建git tag
tag() {
  console.skyblue "请输入tagname:"
  read tagname
  if [ "$tagname" = "" ]; then
    console.red "tagname不能为空"
    exit 1
  fi

  console.skyblue "请输入描述:"

  read detail
  if [ -n "detail" ]; then
    detail="say nothing"
  fi
  if [ "$?" = 0 ]; then
    git tag -a $tagname -m $detail
  fi
}

# 自动生成.gitignore
ignore() {
  if [ -f ".gitignore" ]; then
    console.red ".gitignore已存在"
    return
  fi
  console.green "...正在生成.gitignore"
  touch .gitignore                                                                                                                                # 创建文件
  echo "*.DS_Store  \nnode_modules \n*.log \nidea/ \n*.local \n.DS_Store \ndist \n.cache \n.idea \nlogs \n&-debug.log \n*-error.log" >>.gitignore # 添加内容
}

# clone
clone() {
  str=$1
  str1=${str##*/}
  result=${str1%.*}
  console.skyblue "正在clone $result"
  if [ ! $2 ]; then
    git clone $str && console.pink "下载完成,正在打开 $result" && code $result && cd $result && console.green '正在下载依赖' && ni
  else
    git clone $str && console.pink "下载完成,正在打开 $result" && code $result && cd $result && console.green '正在下载依赖' && ni || ni || ni || console.red '安装依赖失败，请重新尝试' && console.blue "正在执行 nr $2" && nr $2 || eval ${2}
  fi
}

# template
template() {
  console.skyblue "请选择一个模板: ts | vue | nuxt | vitesse | react | next"
  templateName=$(gum choose "ts" "vue" "nuxt" "react" "next")
  if [ ! $1 ]; then
    console.red "需要指定一个模板名称"
    return 0
  fi

  if [ ! $templateName ]; then
    templateName=1
  fi

  if [ $templateName = "ts" ]; then
    console.blue "正在创建$1目录,下载starter-ts模板,请稍等..."
    if [ ! $2 ]; then
      npx degit Simon-He95/starter-ts $1 && console.green "正在打开$1" && code $1 && cd $1 && find ./ -type f -path "./package.json" | xargs sed -i "s:pkg-name:$1:g" && console.pink '正在下载依赖' && ni
    else
      npx degit Simon-He95/starter-ts $1 && console.green "正在打开$1" && code $1 && cd $1 && find ./ -type f -path "./package.json" | xargs sed -i "s:pkg-name:$1:g" && console.pink '正在下载依赖' && ni || ni || ni || console.red '安装依赖失败，请重新尝试' && console.blue "正在执行 nr $2" && nr $2 || eval ${2}
    fi
  elif [ $templateName = "vue" ]; then
    console.blue "正在创建$1目录,下载vitesse-lite模板,请稍等..."
    if [ ! $2 ]; then
      npx degit Simon-He95/vitesse-lite $1 && console.green "正在打开$1" && code $1 && cd $1 && find ./ -type f -path "./package.json" | xargs sed -i "s:pkg-name:$1:g" && console.pink '正在下载依赖' && ni
    else
      npx degit Simon-He95/vitesse-lite $1 && console.green "正在打开$1" && code $1 && cd $1 && find ./ -type f -path "./package.json" | xargs sed -i "s:pkg-name:$1:g" && console.pink '正在下载依赖' && ni || ni || ni || console.red '安装依赖失败，请重新尝试' && console.blue "正在执行 nr $2" && nr $2 || eval ${2}
    fi
  elif [ $templateName = "nuxt" ]; then
    console.blue "正在创建$1目录,下载vitesse-nuxt3模板,请稍等..."
    if [ ! $2 ]; then
      npx degit Simon-He95/vitesse-nuxt3 $1 && console.green "正在打开$1" && code $1 && cd $1 && find ./ -type f -path "./package.json" | xargs sed -i "s:pkg-name:$1:g" && console.pink '正在下载依赖' && ni
    else
      npx degit Simon-He95/vitesse-nuxt3 $1 && console.green "正在打开$1" && code $1 && cd $1 && find ./ -type f -path "./package.json" | xargs sed -i "s:pkg-name:$1:g" && console.pink '正在下载依赖' && ni || ni || ni || console.red '安装依赖失败，请重新尝试' && console.blue "正在执行 nr $2" && nr $2 || eval ${2}
    fi
  elif [ $templateName = "vitesse" ]; then
    console.blue "正在创建$1目录,下载vitesse模板,请稍等..."
    if [ ! $2 ]; then
      npx degit Simon-He95/vitesse $1 && console.green "正在打开$1" && code $1 && cd $1 && find ./ -type f -path "./package.json" | xargs sed -i "s:pkg-name:$1:g" && console.pink '正在下载依赖' && ni
    else
      npx degit Simon-He95/vitesse $1 && console.green "正在打开$1" && code $1 && cd $1 && find ./ -type f -path "./package.json" | xargs sed -i "s:pkg-name:$1:g" && console.pink '正在下载依赖' && ni || ni || ni || console.red '安装依赖失败，请重新尝试' && console.blue "正在执行 nr $2" && nr $2 || eval ${2}
    fi
  elif [ $templateName = "react" ]; then
    console.blue "正在创建$1目录,下载vitesse-lite-react模板,请稍等..."
    if [ ! $2 ]; then
      npx degit Simon-He95/vitesse-lite-react $1 && console.green "正在打开$1" && code $1 && cd $1 && find ./ -type f -path "./package.json" | xargs sed -i "s:pkg-name:$1:g" && console.pink '正在下载依赖' && ni
    else
      npx degit Simon-He95/vitesse-lite-react $1 && console.green "正在打开$1" && code $1 && cd $1 && find ./ -type f -path "./package.json" | xargs sed -i "s:pkg-name:$1:g" && console.pink '正在下载依赖' && ni || ni || ni || console.red '安装依赖失败，请重新尝试' && console.blue "正在执行 nr $2" && nr $2 || eval ${2}
    fi
  elif [ $templateName = "next" ]; then
    console.blue "正在创建$1目录,下载vitesse-next模板,请稍等..."
    if [ ! $2 ]; then
      npx degit Simon-He95/vitesse-next $1 && console.green "正在打开$1" && code $1 && cd $1 && find ./ -type f -path "./package.json" | xargs sed -i "s:pkg-name:$1:g" && console.pink '正在下载依赖' && ni
    else
      npx degit Simon-He95/vitesse-next $1 && console.green "正在打开$1" && code $1 && cd $1 && find ./ -type f -path "./package.json" | xargs sed -i "s:pkg-name:$1:g" && console.pink '正在下载依赖' && ni || ni || ni || console.red '安装依赖失败，请重新尝试' && console.blue "正在执行 nr $2" && nr $2 || eval ${2}
    fi
  fi
}

# remove
remove() {
  if [ $1 ]; then
    if [ ! -f $1 ] && [ ! -d $1 ]; then
      console.red '文件或目录不存在'
      return 0
    else
      console.blue "正在删除$1"
      rimraf $1 && console.green "删除成功" || console.red "删除失败,请重新尝试"
      return 1
    fi
  fi
  for file in $(ls); do
    str="$str\"$file\" "
  done
  content=$(echo $(ls) | sed 's/ /\n/g' | gum choose)
  console.blue "正在删除$content"
  rimraf $content && console.green "删除成功" || console.red "删除失败,请重新尝试"
  return 1
}

# reni
reni() {
  remove node_modules
  if [ $? = 1 ]; then
    ni || ni || ni
  fi
}

# 包裹ni
nii() {
  ni $* || nio $*
}

# pkginit
pkginit() {
  console.blue "请输入包名:"
  read pkgname
  if [ ! $pkgname ]; then
    console.red "包名不能为空"
    return 0
  fi
  if [ -f package.json ]; then
    console.red 'package.json已存在'
    return 0
  fi

  touch package.json
  echo '{
  "name": "'$pkgname'",
  "version": "0.0.0",
  "packageManager": "pnpm@6.32.3",
  "description": "'$pkgname'",
  "author": "Simon He",
  "license": "MIT",
  "repository": {
    "type": "git",
    "url": "git + git@github.com:Simon-He95/'$pkgname'.git"
  },
  "bugs": {
    "url": "https://github.com/Simon-He95/'$pkgname'/issues"
  },
  "keywords": [
    "'$pkgname'"
  ],
  "exports": {
    ".": {
      "types": "./dist/index.d.ts",
      "require": "./dist/index.js",
      "import": "./dist/index.mjs"
    }
  },
  "main": "./dist/index.js",
  "module": "./dist/index.mjs",
  "types": "./dist/index.d.ts",
  "files": [
    "dist"
  ],
  "scripts": {
    "build": "pkgroll --minify",
    "dev": "pkgroll --watch",
    "play": "pnpm run -C playground dev",
    "play:build": "pnpm run -C playground build",
    "serve": "pnpm run -C playground serve",
    "lint": "eslint .",
    "lint:fix": "eslint . --fix",
    "typecheck": "vue-tsc --noEmit",
    "test": "vitest -u",
    "test:e2e": "cypress open",
    "prepublishOnly": "nr build",
    "release": "bumpp --commit --tag --push && pnpm publish"
  },
  "dependencies": {
    "@vueuse/core": "^8.1.1",
    "vue": "^3.2.36"
  },
  "devDependencies": {
    "@antfu/eslint-config": "^0.25.0",
    "@types/node": "^17.0.38",
    "bumpp": "^7.1.1",
    "eslint": "^8.16.0",
    "eslint-plugin-n": "^15.2.1",
    "pkgroll": "^1.3.1",
    "typescript": "^4.7.2",
    "vitest": "^0.7.0"
  },
  "eslintConfig": {
    "extends": "@antfu"
  }
}' >>package.json
  if [ $? = 0 ]; then
    console.green '创建成功'
  else
    console.red '创建失败'
  fi
}

# grant 授予文件权限
grant() {
  chmod +x $1
  console.green '已授权成功'
}

# update 安装最新版本
update() {
  all=$*
  str=${all// /@latest }
  console.green ni $str
  ni $str
}

# commit
commit() {
  commitMessage=$(gum choose "chore: update" "feature: add new funciton" "chore: update dependency" "fix: typo" "chore: init")
  git add . && git commit -m $commitMessage
}

# new 创建新文件
new() {
  currentDir=$(echo ${1%%/*})
  right=$1
  if [ -f $1 ]; then
    console.red '文件已存在'
    return 1
  fi
  while [ true ]; do
    if [ ! -d $currentDir ]; then
      mkdir -p $currentDir
    fi
    right=$(echo ${right#*/})
    currentDir="$currentDir/${right%%/*}"
    end=$(echo $right | grep "/")
    if [[ "$end" == "" ]]; then
      touch $1
      root=$(pwd)
      console.green "$root/$1, created successfully"
      return 1
    fi
  done
}

fpath=($fpath "/home/simon/.zfunctions")

# Set Spaceship ZSH as a prompt
autoload -U promptinit
promptinit
prompt spaceship

export PNPM_HOME="/home/simon/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

source /home/simon/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/simon/.oh-my-zsh/custom/plugins/zsh-z/zsh-z.plugin.zsh
source "/home/simon/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

source "/home/simon/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
fpath=($fpath "/home/simon/.zfunctions")
fpath=($fpath "/home/simon/.zfunctions")

# bun completions
[ -s "/home/simon/.bun/_bun" ] && source "/home/simon/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
