# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# plugins
plugins=(git vscode zsh-autosuggestions zsh-z zsh-syntax-highlighting)

# fnm env
eval "$(fnm env --use-on-cd)"

# User configuration
# -------------------------#
#  Node Package Managerƒ
# -------------------------#

#code
alias github="cd ~/Documents/GitHub"
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
alias p="nr play || d"
alias pr="nr preview"
alias pb="nr play:build || b"
alias release="npm run release"
alias publish="npm publish --access public"
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
alias remote="git remote"
alias gs="git status"
alias fetch="git fetch --all"
alias gcc="git checkout"
alias gcb="git checkout -b"
alias gl="git log"
alias glo="git log --online --graph"
alias gb="git branch"
alias gbd="git branch -d"
alias gba="git branch -a"
alias gbm="git branch -m"
alias gc="git add . && git commit -m"
alias gca="git commit --amend"
alias ga="git add ."
alias gs="git status"
alias gp="git push"
alias gpl="git pull --rebase"
alias gpf="git push --force"
alias gpt="git push origin --tags"
alias gptf="git push origin --tags -f"
alias stash="git stash"
alias pop="git stash pop"
alias rebase="git rebase"
alias main="git checkout main"
alias master="git checkout master"
alias use="nrm use"
alias unproxy="git config --global --unset http.proxy && git config --global --unset https.proxy"
alias proxy="git config --global http.proxy http://127.0.0.1:57932 && git config --global https.proxy https://127.0.0.1:57932"
alias pullmaster="git pull origin master"
alias pullmain="git pull origin main"
alias flog="git reflog"
alias see="ps -ef"

#--------------------------#
# console color
# -------------------------#

RED='\e[1;31m'     # 红
GREEN='\e[1;32m'   # 绿
YELLOW='\e[1;33m'  # 黄
BLUE='\e[1;34m'    # 蓝
PINK='\e[1;35m'    # 粉红
SKYBLUE='\e[1;96m' # 紫
RES='\e[0m'        # 清除颜色

#--------------------------#
# Functions
# -------------------------#

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

# workspace run
run() {
  command="$2"
  workspace=$1
  if [ ! -d "/yarn.lock" ]; then
    tag=1
  else
    tag=0
  fi
  if [ "$2" = "" ]; then
    if [ $tag = 1 ]; then
      yarn $workspace
    else
      pnpm run $workspace
    fi
    return
  elif [ "$2" = "i" -o "$2" = "install" -o "$2" = "add" ]; then
    data=$*
    len1=$workspace
    len2=$2
    if [ $tag = 1 ]; then
      result="yarn workspace "$1" add ${data:$(expr ${#len1} + ${#len2} + 2)}"
    else
      result="pnpm --filter "$1" i ${data:$(expr ${#len1} + ${#len2} + 2)}"
    fi
    eval $result
    return
  elif [ "$2" = "un" -o "$2" = "uninstall" -o "$2" = "remove" ]; then
    data=$*
    len1=$workspace
    len2=$2
    if [ $tag = 1 ]; then
      result="yarn workspace "$1" remove ${data:$(expr ${#len1} + ${#len2} + 2)}"
    else
      result="pnpm --filter "$1" uninstall ${data:$(expr ${#len1} + ${#len2} + 2)}"
    fi
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
  all=$*
  argv=${all#* --}
  if [ $argv = $all ]; then
    if [ $tag = 1 ]; then
      yarn workspace $workspace $command
    else
      pnpm --filter $workspace run $command
    fi
  else
    if [ $tag = 1 ]; then
      yarn workspace $workspace run $command --$argv
    else
      pnpm --filter $workspace run $command --$argv
    fi
  fi
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
  git clone $str && console.pink "下载完成,正在打开 $result" && code $result && cd $result
  if [ -f "package.json" ]; then
    console.green '正在下载依赖' && ni || ni || ni || console.red '安装依赖失败，请重新尝试'
  fi
  if [ $2 ]; then
    console.blue "正在执行 nr $2" && nr $2 || eval ${2}
  fi
}

# template
template() {
  console.skyblue "请选择一个模板: ts | vue-h | vue-template | vue-tsx | nuxt3 | vitesse | react | next | vitepress | playground"
  templateName=$(spaceToLine "starter-ts vitesse-h vitesse-template vitesse-tsx vitesse-nuxt3 vitesse vitesse-lite-react vitesse-next vitesse-vitepress vitesse-playground" | gum filter)
  if [ ! $templateName ]; then
    echo "已取消"
    return 1
  fi

  if [ ! $1 ]; then
    console.red "需要指定一个模板名称"
    return 0
  fi

  console.blue "正在创建$1目录,下载starter-$templateName模板,请稍等..."
  npx degit Simon-He95/$templateName $1 && console.green "正在打开$1" && code $1 && cd $1 
  if [ -f "package.json" ]; then
    echo ${"$(cat ./package.json)//vitesse/$1"}>package.json  && console.pink '正在下载依赖' && ni || ni || ni || console.red '安装依赖失败，请重新尝试'
  fi
  if [ $2 ]; then
    console.blue "正在执行 nr $2" && nr $2 || eval ${2}
  fi

}

# remove
remove() {
  if [ $1 ]; then
    if [ ! -f $1 ] && [ ! -d $1 ]; then
      console.red '文件或目录不存在:('
      return 0
    else
      console.blue "正在删除$1"
      rimraf $1 && console.green "删除成功:)" || console.red "删除失败,请重新尝试:("
      return 1
    fi
  fi
  for file in $(ls); do
    str="$str\"$file\" "
  done
  content=$(echo $(ls) | sed 's/ /\n/g' | gum filter)
  if [ ! $content ]; then
    echo "已取消"
    return 1
  fi
  console.blue "正在删除$content"
  rimraf $content && console.green "删除成功:)" || console.red "删除失败,请重新尝试:("
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
    console.green '创建成功:)'
  else
    console.red '创建失败:('
  fi
}

# grant 授予文件权限
grant() {
  chmod +x $1
  console.green '已授权成功:)'
}

# update 安装最新版本
update() {
  all=$*
    includes $all " -"
    isParams=$?
    console.blue "正在安装最新版本: ${all%% -*}"
    str=${all// /@latest }
  if [[ $isParams == 0 ]];then
    console.green ni $str && ni $str && console.green "安装成功:)"
  else 
    console.green ni $str@latest && ni $str@latest && console.green "安装成功:)"
  fi
}

# commit
commit() {
  if [ $1 ]; then
    git add . && git commit --quiet --allow-empty-message -m "$1"
  else
    commitType="fix feat docs style refactor test chore revert perf build ci"
    TYPE=$(spaceToLine $commitType | gum filter)
    SCOPE=$(gum input --placeholder "scope")
    test -n "$SCOPE" && SCOPE="($SCOPE)"
    SUMMARY=$(gum input --value "$TYPE$SCOPE: " --placeholder "Summary of this change")
    if [ ! $SUMMARY ]; then
      echo "已取消"
      return 1
    fi
    git add . && git commit --quiet --allow-empty-message -m $SUMMARY
  fi
}

# new 创建新文件
new() {
  dir=$(echo $1 | grep '/')
  if [[ $dir = "" ]]; then
    if [[ $(echo $1 | grep '\.') != "" ]]; then
      if [[ -f $1 ]]; then
        console.red '文件已存在'
        return 1
      fi
      touch $1
    else
      if [ -d $1 ]; then
        console.red '文件夹已存在'
        return 1
      fi
      mkdir $1
    fi
    if [[ $? = 1 ]]; then
      console.red "$1, created failed"
      return 1
    fi
    console.green "$1, created successfully"
    return 1
  fi
  currentDir=$(echo ${1%%/*})
  right=$1
  if [[ $(echo $1 | grep '\.') != '' && -f $1 ]]; then
    console.red '文件已存在'
    return 1
  elif [ -d $1 ]; then
    console.red '文件夹已存在'
    return 1
  fi
  while [ true ]; do
    echo $currentDir
    if [ ! -d $currentDir ]; then
      mkdir -p $currentDir
    fi
    right=$(echo ${right#*/})
    currentDir="$currentDir/${right%%/*}"
    end=$(echo $right | grep "/")
    if [[ "$end" == "" ]]; then
      if [[ $(echo $1 | grep '\.') != "" ]]; then
        touch $1
      else
        mkdir $1
      fi
      if [[ $? = 1 ]]; then
        console.red "$1, created failed"
        return 1
      fi
      console.green "$1, created successfully"
      return 0
    fi
  done
}

# reset
reset() {
  head=$(git log --oneline | gum filter | cut -d' ' -f1)
  if [ ! $head ]; then
    echo '已取消'
    return 1
  fi
  git reset --hard $head
}

# cnrm 选择源
co() {
  registery=$(echo $(nrm ls) | sed 's/\/ /\n/g' | gum filter | cut -d'-' -f1)
  registery=$(echo ${registery// /} | sed 's/\*//g')
  if [ ! $registery ]; then
    echo "已取消"
    return 1
  fi
  a=${registery/\* /}
  b=${a%% -*}
  nrm use $b
}

# cnvm 选择node版本 - nvm
cnvm() {
  registery=$(echo $(nvm_ls) | sed 's/system//g' | sed 's/ /\n/g' | gum filter)
  if [ ! $registery ]; then
    echo "已取消"
    return 1
  fi
  nvm use $registery
}

# cfnm 选择node版本 - fnm
cn() {
  current=$(echo $(fnm current))
  registery=$(echo $(fnm ls) | sed 's/system//g' | sed 's/default//g' | sed 's/\* /\n/g' | sed "s/$current/* $current/g" | gum filter)
  registery=$(echo ${registery// /} | sed 's/\*//g')
  if [ ! $registery ]; then
    echo "已取消"
    return 1
  fi
  fnm use ${registery% -*}
}

# cb 选择分支
cb() {
  if [ $1 ]; then
    gcc $1
    return 0
  fi
  branch=$(echo $(git branch) | sed "s/* /*/g" | sed 's/ /\n/g' | sed "s/*/* /g" | gum filter)
  branch=$(echo ${branch// /} | sed 's/\*//g')
  if [ ! $branch ]; then
    echo "已取消"
    return 1
  fi
  gcc $(echo $branch | sed "s/*//g")
}

# db 删除分支
db() {
  branch=$(git branch -a | cut -c 3- | gum filter)
  includes $branch "remotes/"
  isRemote=$?
  if [ $isRemote = 0 ]; then
    origin=$(echo ${branch#remotes/}  | cut -d'/' -f1)
    _branch=$(echo $branch | sed "s/remotes\/$origin\///g")
    git push $origin --delete $_branch
  else
    git branch -D $branch
  fi
}

# checkout the chosen PR
cpr() {
  gh pr list | cut -f1,2 | gum choose | cut -f1 | xargs gh pr checkout
}

## 字符串替换
replace() {
  echo $1 | sed "s/$2/$3/g"
}

## 空格替换换行
spaceToLine() {
  replace $1 " " "\n"
}

# includes 判断是否包含
includes(){
  result=$(echo $1 | grep "$2")
  if [[ $result != "" ]];then 
    return 0
  fi
    return 1
}

# merge
merge() {
  if [ $1 ]; then
    git merge $1
    return 0
  fi
  branch=$(echo $(git branch) | sed "s/* /*/g" | sed 's/ /\n/g' | sed "s/*/* /g" | gum filter)
  branch=$(echo ${branch// /} | sed 's/\*//g')
  if [ ! $branch ]; then
    echo "已取消"
    return 1
  fi
  git merge $(echo $branch | sed "s/*//g")
}

# before 查找前20条使用过的命令
before() {
  command=$(history | tail -20 | cut -c 8- | gum filter)
  if [ ! $command ]; then
    echo "已取消"
    return 1
  fi
  $command
}


# source plugin
source "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.oh-my-zsh/custom/plugins/zsh-z/zsh-z.plugin.zsh"
source "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
source "$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
