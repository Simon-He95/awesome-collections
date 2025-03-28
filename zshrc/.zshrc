# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# plugins
plugins=(git web-search zsh-autosuggestions zsh-syntax-highlighting last-working-dir)


# User configuration
# -------------------------#
#  Node Package Managerƒ
# -------------------------#

# python
alias python=python3
# python3 -m venv py simon
# source simon/bin/activate

# taze
alias taze="npx taze -w -r"

# code
alias Github="cd ~/GitHub" # 快速进入github文件夹
alias Go="cd ~/go" # 快速进入github文件夹
alias gopath="cd ~/go/src"
alias goi="go get"
alias gor="go run"
alias gob="go build"
alias draw="~/go/bin/draw"
alias gom="gor main.go"
alias goinit="go mod init"
alias rustinit="cargo new"

# pnpm-patch-i 
alias patch="pnpm-patch-i"

# alias - pi -> @simon_he/pi
alias c=clone
alias i="pi"
alias il="pil"
alias ui="pui"
alias r="prun"
alias f="pfind"
alias cacheclean="npm cache clean --force"
alias nio="pi --prefer-offline" # npm install offline 离线安装
alias d="prun dev || prun start" # dev 启动dev环境
alias D="prun dev || prun start" # dev 启动dev环境
alias s="prun start || prun dev || prun serve" # start the server 启动项目
alias S="prun start || prun dev || prun serve" # start the server 启动项目
alias ck="prun check" # check type
# alias b="prun build" # build 执行打包
alias bw="prun build --watch" # watch mode 执行构建并监视文件更改
alias t="prun test" # test 执行测试
alias tu="prun test -u" # update snapshots 执行测试并更新快照
alias w="prun watch" # watch mode 执行watch命令
alias lint="prun lint" # eslint 检查eslint
alias lintf="prun lint --fix" # fix linting errors 修复eslint错误
alias fmt="prun fmt || lintf" # fix linting errors 修复eslint错误
alias p="prun play || prun pack || d" # play or dev 启动项目
alias pr="prun preview || open dist/index.html" # preview 预览
alias pb="prun play:build || b" # build and play 执行playground打包
alias publish="npm publish --access=public" # publish to npm 发布到npm
alias clean="git add . && git commit -m 'chore: clean' && git push" # clean 提交清理
alias v="npm view" # 查看包信息
alias lock="pnpm install --no-frozen-lockfile" # 更新依赖
alias port="lsof -i " #查看端口号下进程

#--------------------------#
# project simple
# -------------------------#

alias cls="clear" # 清理终端
alias ..="cd .." # 返回上一级
alias 。。="cd .." # 返回上一级
alias ...="cd ../.." # 返回上上级
alias 。。。="cd ../.." # 返回上上级
alias ....="cd ../../.." # 返回上上上级
alias 。。。。="cd ../../.." # 返回上上上级
alias link="npm link" # link 本地包
alias unlink="npm unlink" # unlink 本地包
alias rmmodule="remove !" # 删除node_modules

#--------------------------#
# Git
# -------------------------#

alias remote="git remote" # 查看远程仓库
alias gs="git status" # 查看状态
alias fetch="git fetch --all && gpl" # 拉取远程仓库
alias gcc="git checkout" # 切换分支
alias gl="git log" # 查看提交日志
alias glo="git log --online --graph" # 查看提交日志
alias gb="git branch" # 查看分支
alias gbd="git branch -D" # 删除分支
alias gba="git branch -a" # 查看所有分支
alias gbm="git branch -m" # 重命名分支
alias gc="git add . && git commit -m" # 提交
alias gcv="git add . && git commit --no-verify -m" # 提交
alias gca="git commit --amend --message=" # 修改最后一次提交
alias cmt="commit" #  git 提交
alias ga="git add ." # 添加
alias gp="git push" # 推送
alias gpl="git pull --rebase" # 拉取
alias gpf="git push --force" # 强制推送
alias gpt="git push origin --tags" # 推送所有标签
alias gptf="git push origin --tags -f" # 强制推送所有标签
alias stash="git stash" # 暂存
alias pop="git stash pop" # 恢复暂存
alias abort="git rebase --abort" # 退出变基
alias main="git checkout main" # 切换到主分支
alias master="git checkout master" # 切换到主分支
alias use="nrm use" # 切换npm源
alias unproxy="git config --global --unset http.proxy && git config --global --unset https.proxy" # 取消代理
alias proxy="git config --global http.proxy http://127.0.0.1:7890 && git config --global https.proxy https://127.0.0.1:7890" # 设置代理
alias pullmaster="git pull origin master" # 拉取主分支
alias pullmain="git pull origin main" # 拉取主分支
alias flog="git reflog" # 查看提交日志
alias see="ps -ef" # 查看进程
alias typecheck="prun typecheck"
alias ignorecase="git config core.ignorecase false" # git 提交 区分大小写
alias checkout="git checkout ."
alias chore="git add . && git commit --quiet --allow-empty-message -m \"chore: update\""
#--------------------------#
# vsce
# -------------------------#

alias package="vsce package" # vscode 插件 打包
alias vpublish="vsce publish" # vscode 插件 发布

#--------------------------#
# ipinfo -> brew install ipinfo-cli
# -------------------------#

alias ip="ipinfo myip"

#--------------------------#
# ccommand
# -------------------------#

# alias c="ccommand" # 选择当前scripts命令
# alias cf="ccommand find" # 查找workspace命令

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
# Other
# -------------------------#
alias zshrc="source ~/.zshrc"
#--------------------------#
# Functions
# -------------------------#

logRed() {
  echo -e "${RED} $* ${RES}"
}

logGreen() {
  echo -e "${GREEN} $* ${RES}"
}

logYellow() {
  echo -e "${YELLOW} $* ${RES}"
}

logBlue() {
  echo -e "${BLUE} $* ${RES}"
}

logSkyblue() {
  echo -e "${SKYBLUE} $* ${RES}"
}
logPink() {
  echo -e "${PINK} $* ${RES}"
}

# run 正对pnpm、yarn workspace 根目录执行子命令
run() {
  if [ -f "go.mod" ];then
    go run $1
    return 0
  elif [ -f "Cargo.toml" ];then
    cargo run $1
    return 0
  fi
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
  logSkyblue "请输入tagname:"
  read tagname
  if [ "$tagname" = "" ]; then
    logRed "tagname不能为空"
    exit 1
  fi

  logSkyblue "请输入描述:"

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
    logRed ".gitignore已存在"
    return
  fi
  logGreen "...正在生成.gitignore"
  touch .gitignore                                                                                                                                # 创建文件
  echo "*.DS_Store  \nnode_modules \n*.log \nidea/ \n*.local \n.DS_Store \ndist \n.cache \n.idea \nlogs \n&-debug.log \n*-error.log" >>.gitignore # 添加内容
}

endWith(){
  if echo "$1" | grep -q -E "$2$"
  then return 0
  else return 1
  fi
}

# clone 项目clone
clone() {
  command=$2
  hasWrong=0
  
  # Check if first argument is a directory in current location
  if [ "$1" != "" ] && [ -d "$1" ]; then
    logSkyblue "正在打开目录: $1"
    code "$1"
    return 0
  fi

  if [ $(uname) = "Darwin" ]; then
    paste="pbpaste"
  else
    paste="powershell.exe -Command \"Get-Clipboard\""
  fi
  
  paste_content=$($paste)
  # If no arguments and we're not trying to clone, open current directory
  if [ "$1" = "" ] && [ "$paste_content" = "" ]; then
    logSkyblue "正在打开当前目录"
    code .
    return 0
  fi

  # If no arguments and we're not trying to clone, open current directory
  if [ "$1" = "" ] && [ "$paste_content" != "" ]; then
    isGit "$paste_content"
    if [ $? = 1 ]; then
      logSkyblue "正在打开当前目录"
      code .
      return 0
    fi
  fi

  # 默认clone在我的Github文件夹下
  Github

  if [ "$1" = "" ]; then
    str=$($paste)
  else
    isGit "$1"
    if [ $? = 1 ];then
      str=$($paste)
      command=$1
    else
      str=$1
    fi
  fi
  isGit "${str}"
  if [ $? = 1 ]; then    
    logRed "请输入正确的git地址"
    return
  fi
  str1=${str##*/}
  result=${str1%.*}
  if [ -d $result ]; then
    logSkyblue "已存在同名目录，正在为您直接打开..."
    code $result
    cd $result && fetch
    return 0
  fi
  logSkyblue "正在clone $result"

  git clone $str && logPink "下载完成,正在打开 $result" && code $result && cd $result || hasWrong=1
  if [ -f "package.json" ]; then
    logGreen '正在下载依赖' && pi || pi || pi || logRed '安装依赖失败，请重新尝试'
  fi
  if [ "$command" ]; then
    logBlue "正在执行 prun $command" && prun $command || eval $command
  fi

  # 回到上一级目录
  if [ "$hasWrong" = 0 ];then
    cd ..
  fi
}

# isGit 判断是否是一个.git URL
isGit(){
  # If no argument provided, return false
  if [ -z "$1" ]; then
    return 1
  fi
  
  # Check if the string ends with .git
  if echo "$1" | grep -q -E "\.git$"; then
    # Additionally verify it looks like a URL (contains :// or user@host:)
    if echo "$1" | grep -q -E "(://|@.*:)"; then
      return 0  # It's a git URL
    fi
  fi
  
  # Check if it's an https URL to a git repository
  if echo "$1" | grep -q -E "^https://.*/(.*)/(.*)$"; then
    if echo "$1" | grep -q -E "github\.com|gitlab\.com|bitbucket\.org"; then
      return 0  # It's likely a git repository URL even without .git
    fi
  fi
  
  # Not a git URL
  return 1
}

# template 选择项目模板
template() {
  projectName=$1
  hasWrong=0
  if [ "$projectName" = "" ]; then
    projectName=$(gum input --placeholder " 请输入项目名称")
  fi
  if [ "$projectName" = "" ]; then
    echo "项目名称不能为空"
    return 0
  fi
  logSkyblue "请选择一个模板: ts | unplugin-starter | vue-uno | vue-tailwind | vue-h | uniapp | vue-template | vue-js-template | vue-tsx | nuxt3 | vitesse | react-uno | react-tailwind | next | vitepress | vite-ssr | react-ssr | svelte | solid | vscode"
  templateName=$(spaceToLine "starter-ts unplugin-starter vitesse-vue-uno vitesse-vue-tailwind vitesse-h vitesse-template vitesse-jsvue vitesse-tsx vitesse-nuxt3 vitesse vitesse-lite-react vitesse-next vitesse-vitepress vitesse-vitessr vitesse-reactssr vitesse-svelte vitesse-solid vitesse-vscode" | gum filter --placeholder=" 请选择一个模板 ts | vue-h | vue-template | vue-tsx | nuxt3 | vitesse | react | next | vitepress | vite-ssr | react-ssr | svelte | solid | vscode")
  if [ ! $templateName ]; then
    echo "已取消"
    return 1
  fi


  logBlue "正在创建$projectName目录,下载 $templateName模板,请稍等..."
  npx degit Simon-He95/$templateName $projectName && logGreen "正在打开$projectName" && code $projectName && cd $projectName || hasWrong=1
  if [ -f "package.json" ]; then
    echo ${"$(cat ./package.json)//vitesse/$projectName"}>package.json  && logPink '正在下载依赖' && pi || pi || pi || logRed '安装依赖失败，请重新尝试'
  fi
  if [ "$2" ]; then
    logBlue "正在执行 prun $2" && prun $2 || eval ${2}
  fi

  # 回到上一级目录
  if [ "$hasWrong" = 0 ];then
    cd ..
  fi
}

# remove 删除文件或目录
remove() {
  root=~
  if [ "$1" = "$root" ];then
    logRed "不允许删除根目录！"
    return 1
  fi
  
  # remove . -> 删除当前目录
  if [ "$1" = "." ];then
    _path=$(pwd)
    current=$(basename $_path)
    logBlue "正在删除当前目录"
    _current="../${current}"
    
    # Fix the confirmation handling
    gum confirm "确认要删除${current}目录吗?"
    confirm_status=$?
    
    if [ $confirm_status -eq 0 ]; then
      rimraf $_current
      if [ $? -eq 0 ]; then
        logGreen "删除成功👅"
        cd ..
      else
        logRed "删除失败,请重新尝试:("
      fi
    else
      echo "已取消"
    fi
    return 0
  fi
  
  # remove ! -> 删除node_modules
  if [ "$1" = "!" ];then
    logBlue "正在删除node_modules"
    rimraf "node_modules"
    if [ $? -eq 0 ]; then
      logGreen "删除成功👅"
    else
      logRed "删除失败,请重新尝试:("
    fi
    return 0
  fi
  
  # Handle specific file/directory deletion
  if [ "$1" ]; then
    if [ ! -f "$1" ] && [ ! -d "$1" ]; then
      logRed '文件或目录不存在:('
      return 0
    else
      logBlue "正在删除$1"
      
      # Fix the confirmation handling
      gum confirm "确认要删除$1吗?"
      confirm_status=$?
      
      if [ $confirm_status -eq 0 ]; then
        rimraf $1
        if [ $? -eq 0 ]; then
          logGreen "删除成功👅"
        else
          logRed "删除失败,请重新尝试:("
        fi
      else
        echo "已取消"
      fi
      return 0
    fi
  fi
  
  # Handle selection from current directory
  for file in $(ls); do
    str="$str\"$file\" "
  done
  content=$(echo $(ls) | sed 's/ /\n/g' | gum filter --placeholder=" 请选择要删除的文件或目录")
  if [ ! "$content" ]; then
    echo "已取消"
    return 1
  fi
  logBlue "正在删除$content"
  
  # Fix the confirmation handling
  gum confirm "确认要删除$content吗?"
  confirm_status=$?
  
  if [ $confirm_status -eq 0 ]; then
    rimraf $content
    if [ $? -eq 0 ]; then
      logGreen "删除成功👅"
    else
      logRed "删除失败,请重新尝试:("
    fi
  else
    echo "已取消"
  fi
  return 0
}

# reni
reni() {
  remove node_modules
  if [ $? = 1 ]; then
    pi || pi || pi
  fi
}

# 包裹ni
nii() {
  pi $* || nio $*
}

# pkginit 生成package.json
pkginit() {
  logBlue "请输入包名:"
  read pkgname
  if [ ! $pkgname ]; then
    logRed "包名不能为空"
    return 0
  fi
  if [ -f package.json ]; then
    logRed 'package.json已存在'
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
    "prepublishOnly": "pnpm run build",
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
    logGreen '创建成功👅'
  else
    logRed '创建失败:('
  fi
}

# grant 授予文件权限
grant() {
  chmod +x $1
  logGreen '已授权成功👅'
}

# update 安装最新版本
update() {
  if [ -f "Cargo.toml" ];then
    cargo update
    return 0
  fi
  all=$*
    includes $all " -"
    isParams=$?
    logBlue "正在安装最新版本: ${all%% -*}"
    str=${all// /@latest }
  if [[ $isParams == 0 ]];then
    logGreen pi $str && pi $str && logGreen "安装成功👅"
  else
    logGreen pi $str@latest && pi $str@latest && logGreen "安装成功👅"
  fi
}

# commit git 提交
commit() {
  if [[ $1 != "" && $1 != "-p" ]]; then
    git add . && git commit --quiet --allow-empty-message -m "$1"
    if [ $2 = "-p" ];then
      gp
    fi
  else
    commitType="chore fix feat refactor docs style test revert perf build ci"
    TYPE=$(spaceToLine $commitType | gum filter --placeholder=" 请选择提交类型")
    if [ $? = 130 ];then
      echo "已取消"
      return 1
    fi
    SCOPE=$(gum input --placeholder "scope")
      if [ $? = 130 ];then
      echo "已取消"
      return 1
    fi
    test -n "$SCOPE" && SCOPE="($SCOPE)"
    SUMMARY=$(gum input --value "$TYPE$SCOPE: " --placeholder "Summary of this change")
    if [ ! $SUMMARY ]; then
      echo "已取消"
      return 1
    fi
    title=$(getTitle $SUMMARY)
    header=$(getHeader "Commit Message:")
    gum join --vertical "$header" "$title"
    git add . && git commit --quiet --allow-empty-message -m $SUMMARY
    haveError=$?
    if [ $haveError = 1 ];then
      return 1
    fi
     if [[ $1 == "-p" ]];then
      gp
      else
      gum confirm "Do you want to push this commit ?" && gp
    fi
  fi
  print -s "git commit --quiet --allow-empty-message -m \"$SUMMARY\""
}

# new 创建新文件或目录
new() {
  dir=$(echo $1 | grep '/')
  if [[ $dir = "" ]]; then
    if [[ $(echo $1 | grep '\.') != "" ]]; then
      if [[ -f $1 ]]; then
        logRed '文件已存在'
        return 1
      fi
      touch $1
    else
      if [ -d $1 ]; then
        logRed '文件夹已存在'
        return 1
      fi
      mkdir $1
    fi
    if [[ $? = 1 ]]; then
      logRed "$1, created failed"
      return 1
    fi
    logGreen "$1, created successfully"
    return 1
  fi
  currentDir=$(echo ${1%%/*})
  right=$1
  if [[ $(echo $1 | grep '\.') != '' && -f $1 ]]; then
    logRed '文件已存在'
    return 1
  elif [ -d $1 ]; then
    logRed '文件夹已存在'
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
        logRed "$1, created failed"
        return 1
      fi
      logGreen "$1, created successfully"
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
  registery=$(echo $(fnm ls) | sed 's/system//g' | sed 's/default//g' | sed 's/\* /\n/g' | sed "s/$current/\* $current/g" | sed '/^$/d' | gum filter --placeholder=" 请选择一个node版本")
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
  if [ $? = 130 ];then
    echo "已取消"
    return 1
  fi
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

#nb 创建新分支
nb(){
  if [[ $1 == "" ]];then
    branch=$(gum input --placeholder " 请输入新分支名" | sed 's/ //g')
  else
    branch=$1
  fi
  if [[ $? == 130 ]]; then
    echo "已取消"
    return 1
  fi
  if [[  $branch == '' ]]; then
    echo "分支名不能为空"
    return 1
  fi
  gum confirm "是否基于当前分支创建?"
  if [[ $? == 0 ]]; then
    git checkout -b $branch
    return 0
  fi
  base=$(git branch -a | cut -c 3-  | gum filter --placeholder=" 请选择基于哪个分支创建")
   if [[ $? == 130 ]]; then
    echo "已取消"
    return 1
  fi
  includes $base "remotes/"
  isRemote=$?
  if [ $isRemote = 0 ]; then
    _branch=$(echo $base | sed "s/remotes\///g")
    git checkout -b $branch $_branch
  else
    git checkout -b $branch $base
  fi
}

# db 删除分支
db() {
  branch=$(git branch -a | cut -c 3- | gum filter --no-limit --placeholder=" 请选择一个分支删除")
  if [[ $? == 130 ]]; then
    echo "已取消"
    return 1
  fi
  
  # Split multi-selection into an array
  branches=($(echo "$branch" | tr ' ' '\n'))
  
  for br in "${branches[@]}"; do
    br=$(trim "$br")
    
    includes "$br" "remotes/"
    isRemote=$?
    
    if [ $isRemote = 0 ]; then
      # Handle remote branch
      origin=$(echo ${br#remotes/} | cut -d'/' -f1)
      _branch=$(echo $br | sed "s/remotes\/$origin\///g")
      echo "Deleting remote branch: $_branch from $origin"
      git push $origin --delete $_branch
    else
      # Handle local branch
      echo "Deleting local branch: $br"
      git branch -D "$br"
    fi
  done
}

# checkout the chosen PR
cpr() {
  npx gh pr list | cut -f1,2 | gum choose | cut -f1 | xargs gh pr checkout
}

##字符串替换
replace() {
  echo $1 | sed "s/$2/$3/g"
}

# 空格替换换行
spaceToLine() {
  replace $1 " " "\n"
}

# 换行替换成空格
lineToSpace() {
  echo "$1" | tr '\n' ' '
}

# 删除换行
remoteLine() {
  echo "$1" | tr -d '\n'
}

# 删除内容前后空格
trim() {
  echo "$1" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//'
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

# rebase 选择分支合并到当前
rebase() {
  if [ $1 ]; then
    git rebase $1
    return 0
  fi
  branch=$(echo $(git branch) | sed "s/* /*/g" | sed 's/ /\n/g' | sed "s/*/* /g" | gum filter --placeholder=" 请选择一个分支合并")
  branch=$(echo ${branch// /} | sed 's/\*//g')
  if [ ! $branch ]; then
    echo "已取消"
    return 1
  fi
  git rebase $(echo $branch | sed "s/*//g")
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

# style
getTitle(){
  gum style \
        --foreground 212 \
        --align left --width 50  --padding "0 2" \
        "$1"
}

# style
getHeader(){
  gum style \
        --foreground 62   --bold --italic  \
        --align left --width 50  --padding "1 1" \
        "$1"
}

# write file
wf(){
  if [[ $1 == "" ]];then
    logRed "请输入要写入的文件"
    return 1
  fi
  getTitle "以esc 或 ctrl + D 确认写入内容 ✍️"
  gum write > $1
}

# copy directory
cpd(){
  if [[ $1 == "" ]];then
    logRed "请输入要复制的目录"
    return 1
  fi
  if [[ $2 == "" ]];then
    logRed "请输入要复制到的目录"
    return 1
  fi
  cp -r $1 $2
}

# build
b(){
  if [ -f "Cargo.toml" ];then
    cargo build
    return 0
  elif [ -f "go.mod" ];then
    go build
    return 0
  fi
  prun build
}

# release a new version 发布新版本
release(){
  if [ -f "Cargo.toml" ];then
    cargo build --release
    return 0
  elif [ -f "go.mod" ];then
    go build -tags="release"
    return 0
  fi
  npm run release
}

# check
check(){
  if [ -f "Cargo.toml" ];then
    cargo check
  return 0
  fi
  prun check
}


# web-search
search(){
  web_search $*
}

# rename 修改目录或者文件名
rename(){
  if [ "$1" = "." ];then 
    url=$(pwd)
    dir=$(basename $url)
    cd ..
    mv "$dir" "$2"
    if [ $? = 0 ];then
      logGreen "文件名$1已成功修改为$2"
    fi
    cd "$2"
    return
  fi
  mv "$1" "$2"
  if [ $? = 0 ];then
    logGreen "文件名$1已成功修改为$2"
  fi
}

# killer
killer(){
  data=$(ps > .ps.temp)
  content=$(tail -n +2 .ps.temp > ._ps.temp)
  result=$(cat ._ps.temp | gum filter | cut -d ' ' -f 1) 
   if [ $? -eq 130 ] || [ -z "$result" ];then
      echo "已取消"
      rimraf .ps.temp
      rimraf ._ps.temp
      return 1
    fi
  rimraf .ps.temp
  rimraf ._ps.temp
  gum confirm "确认要杀死${result}端口进程吗?" && echo "kill -9 ${result}" || echo "已取消"
}

# source plugin 引入插件
source "$HOME/.oh-my-zsh/oh-my-zsh.sh"

# 修改终端标题
ZSH_THEME_TERM_TITLE_IDLE="Simon"


# bun completions
[ -s "/Users/Simon/.bun/_bun" ] && source "/Users/Simon/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export LANG=en_US.UTF-8

export https_proxy=http://127.0.0.1:7890 
export http_proxy=http://127.0.0.1:7890 
export all_proxy=socks5://127.0.0.1:7890
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export JAVA_HOME=$(/usr/libexec/java_home -v"17");

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Added by Windsurf
export PATH="/Users/Simon/.codeium/windsurf/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/Simon/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
