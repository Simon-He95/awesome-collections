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
alias github="cd ~/Documents/GitHub" # 快速进入github文件夹

# alias - ni

alias nio="ni --prefer-offline" # npm install offline 离线安装
alias d="nr dev" # dev 启动dev环境
alias s="nr start" # start the server 启动项目
alias b="nr build" # build 执行打包
alias bw="nr build --watch" # watch mode 执行构建并监视文件更改
alias t="nr test" # test 执行测试
alias t="nr test -u" # update snapshots 执行测试并更新快照
alias w="nr watch" # watch mode 执行watch命令
alias lint="nr lint" # eslint 检查eslint
alias lintf="nr lint:fix" # fix linting errors 修复eslint错误
alias p="nr play || d" # play or dev 启动项目
alias pr="nr preview" # preview 预览
alias pb="nr play:build || b" # build and play 执行playground打包
alias release="npm run release" # release a new version 发布新版本
alias publish="npm publish --access public" # publish to npm 发布到npm
alias clean="git add . && git commit -m 'chore: clean' && git push" # clean 提交清理
alias v="npm view" # 查看包信息
alias lock="pnpm install --no-frozen-lockfile" # 更新依赖

#--------------------------#
# project simple
# -------------------------#

alias cls="clear" # 清理终端
alias ..="cd .." # 返回上一级
alias ...="cd ../.." # 返回上上级
alias ....="cd ../../.." # 返回上上上级
alias link="npm link" # link 本地包

#--------------------------#
# Git
# -------------------------#
alias remote="git remote" # 查看远程仓库
alias gs="git status" # 查看状态
alias fetch="git fetch --all" # 拉取远程仓库
alias gcc="git checkout" # 切换分支
alias gcb="git checkout -b" # 创建并切换分支
alias gl="git log" # 查看提交日志
alias glo="git log --online --graph" # 查看提交日志
alias gb="git branch" # 查看分支
alias gbd="git branch -d" # 删除分支
alias gba="git branch -a" # 查看所有分支
alias gbm="git branch -m" # 重命名分支
alias gc="git add . && git commit -m" # 提交
alias gca="git commit --amend" # 修改最后一次提交
alias ga="git add ." # 添加
alias gp="git push" # 推送
alias gpl="git pull --rebase" # 拉取
alias gpf="git push --force" # 强制推送
alias gpt="git push origin --tags" # 推送所有标签
alias gptf="git push origin --tags -f" # 强制推送所有标签
alias stash="git stash" # 暂存
alias pop="git stash pop" # 恢复暂存
alias rebase="git rebase" # 重写提交
alias main="git checkout main" # 切换到主分支
alias master="git checkout master" # 切换到主分支
alias use="nrm use" # 切换npm源
alias unproxy="git config --global --unset http.proxy && git config --global --unset https.proxy" # 取消代理
alias proxy="git config --global http.proxy http://127.0.0.1:57932 && git config --global https.proxy https://127.0.0.1:57932" # 设置代理
alias pullmaster="git pull origin master" # 拉取主分支
alias pullmain="git pull origin main" # 拉取主分支
alias flog="git reflog" # 查看提交日志
alias see="ps -ef" # 查看进程

#--------------------------#
# vsce 
# -------------------------#

alias package="vsce package" # vscode 插件 打包
alias vpublish="vsce publish" # vscode 插件 发布

#--------------------------#
# ccommand 
# -------------------------#

alias c="ccommand" # 选择当前scripts命令
alias cf="ccommand find" # 查找workspace命令

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

color () {  # 设置颜色
  gum style --foreground "$1" "$2"
}

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

# run 正对pnpm、yarn workspace 根目录执行子命令
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

# tag 创建git tag
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

# clone 项目clone
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

# template 选择项目模板
template() {
  console.skyblue "请选择一个模板: ts | vue-h | vue-template | vue-tsx | nuxt3 | vitesse | react | next | vitepress"
  templateName=$(spaceToLine "starter-ts vitesse-h vitesse-template vitesse-tsx vitesse-nuxt3 vitesse vitesse-lite-react vitesse-next vitesse-vitepress" | gum filter --placeholder=" 请选择一个模板 ts | vue-h | vue-template | vue-tsx | nuxt3 | vitesse | react | next | vitepress")
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

# remove 删除文件或目录
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
  content=$(echo $(ls) | sed 's/ /\n/g' | gum filter --placeholder=" 请选择要删除的文件或目录")
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

# pkginit 生成package.json
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

# commit git 提交
commit() {
  if [ $1 ]; then
    git add . && git commit --quiet --allow-empty-message -m "$1"
  else
    commitType="fix feat docs style refactor test chore revert perf build ci"
    TYPE=$(spaceToLine $commitType | gum filter --placeholder=" 请选择提交类型")
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

# new 创建新文件或目录
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

# reset 重置到某一次的commit
reset() {
  head=$(git log --oneline | gum filter --placeholder=" 请选择一个要重置的版本" | cut -d' ' -f1)
  if [ ! $head ]; then
    echo '已取消'
    return 1
  fi
  git reset --hard $head && echo '已重置到' $head
}

# reset 撤销某一次的commit
revert() {
  head=$(git log --author="Simon He" --oneline | gum filter --placeholder=" 请选择一个要还原的提交" | cut -d' ' -f1)
  if [ ! $head ]; then
    echo '已取消'
    return 1
  fi
  git revert $head -n && echo $head '提交已还原' 
}

# cnrm 选择源
co() {
  registery=$(echo $(nrm ls) | sed 's/\/ /\n/g' | gum filter --placeholder=" 请选择一个源"| cut -d'-' -f1)
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
  registery=$(echo $(nvm_ls) | sed 's/system//g' | sed 's/ /\n/g' | gum filter --placeholder=" 请选择一个node版本")
  if [ ! $registery ]; then
    echo "已取消"
    return 1
  fi
  nvm use $registery
}

# cfnm 选择node版本 - fnm
cn() {
  current=$(echo $(fnm current))
  registery=$(echo $(fnm ls) | sed 's/system//g' | sed 's/default//g' | sed 's/\* /\n/g' | sed "s/$current/* $current/g" | gum filter --placeholder=" 请选择一个node版本")
  registery=$(echo ${registery// /} | sed 's/\*//g')
  if [ ! $registery ]; then
    echo "已取消"
    return 1
  fi
  fnm use ${registery% -*}
}

# cb 选择分支切换
cb() {
  if [ $1 ]; then
    gcc $1
    return 0
  fi
  branch=$(git branch -a | cut -c 3-  | gum filter --placeholder=" 选择一个分支切换")
  includes $branch "remotes/"
  isRemote=$?
  if [ $isRemote = 0 ]; then
    origin=$(echo ${branch#remotes/}  | cut -d'/' -f1)
    _branch=$(echo $branch | sed "s/remotes\/$origin\///g")
      gcc $(echo $_branch | sed "s/*//g")
  else
      gcc $(echo $branch | sed "s/*//g")
  fi
}

# db 删除分支
db() {
  branch=$(git branch -a | cut -c 3- | gum filter --placeholder=" 请选择一个分支删除")
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

##字符串替换
replace() {
  echo $1 | sed "s/$2/$3/g"
}

# 空格替换换行
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

# merge 选择分支合并到当前
merge() {
  if [ $1 ]; then
    git merge $1
    return 0
  fi
  branch=$(echo $(git branch) | sed "s/* /*/g" | sed 's/ /\n/g' | sed "s/*/* /g" | gum filter --placeholder=" 请选择一个分支合并")
  branch=$(echo ${branch// /} | sed 's/\*//g')
  if [ ! $branch ]; then
    echo "已取消"
    return 1
  fi
  git merge $(echo $branch | sed "s/*//g")
}

# before 查找前20条使用过的命令
before() {
  command=$(history | tail -20 | cut -c 8- | gum filter --placeholder=" 请选择一个命令")
  if [ ! $command ]; then
    echo "已取消"
    return 1
  fi
  $command
}


# source plugin 引入插件
source "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.oh-my-zsh/custom/plugins/zsh-z/zsh-z.plugin.zsh"
source "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
source "$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
