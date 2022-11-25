# web_search from terminal

function web_search() {
  emulate -L zsh

  # define search engine URLS
  typeset -A urls
  urls=(
    $ZSH_WEB_SEARCH_ENGINES
    gg              "https://www.google.com/search?q="
    google          "https://www.google.com/search?q="
    bing            "https://www.bing.com/search?q="
    brave           "https://search.brave.com/search?q="
    yahoo           "https://search.yahoo.com/search?p="
    duckduckgo      "https://www.duckduckgo.com/?q="
    startpage       "https://www.startpage.com/do/search?q="
    yandex          "https://yandex.ru/yandsearch?text="
    gb              "https://github.com/search?q="
    github          "https://github.com/search?q="
    bd              "https://www.baidu.com/s?wd="
    baidu           "https://www.baidu.com/s?wd="
    ecosia          "https://www.ecosia.org/search?q="
    goodreads       "https://www.goodreads.com/search?q="
    qwant           "https://www.qwant.com/?q="
    givero          "https://www.givero.com/search?q="
    stackoverflow   "https://stackoverflow.com/search?q="
    wolframalpha    "https://www.wolframalpha.com/input/?i="
    archive         "https://web.archive.org/web/*/"
    scholar         "https://scholar.google.com/scholar?q="
    ask             "https://www.ask.com/web?q="
    npm             "https://www.npmjs.com/search?q="
    youku           "https://www.youku.com/search_video/q_"
    youtube         "https://www.youtube.com/results?search_query="
    jd              "https://search.jd.com/Search?keyword="
    tb              "https://s.taobao.com/search?q="
    taobao          "https://s.taobao.com/search?q="
    tt              "https://twitter.com/search?q="
    twitter         "https://twitter.com/search?q="
    reg             "https://regex101.com/"
    figma           "https://www.figma.com/search/?q="
    sign            "http://m.uustv.com/yw.php"
    vercel          "https://vercel.com/dashboard"
    netlify         "https://app.netlify.com/teams/simon-he95/overview"
    icones          "https://icones.js.org/collection/fa?s="
    ast             "https://astexplorer.net/"
    babel           "https://babeljs.io/repl#?browsers=defaults%2C%20not%20ie%2011%2C%20not%20ie_mob%2011&build=&builtIns=false&corejs=3.21&spec=false&loose=false&code_lz=MYewdgzgLgBCBGArGBeGBvAvgKAJYDMAKBRAfgDowBDAWwFMBKdbUSEAGzvPZAHNCA5AAsqIgQ2w4CxJDABkcuEkq1GzVhA5ce_YaKrjJQA&debug=false&forceAllTransforms=false&shippedProposals=false&circleciRepo=&evaluate=false&fileSize=false&timeTravel=false&sourceType=module&lineWrap=true&presets=env%2Creact%2Cstage-2&prettier=false&targets=&version=7.20.4&externalPlugins=&assumptions=%7B%7D"
    bb              "https://search.bilibili.com/all?keyword="
    bilibili        "https://search.bilibili.com/all?keyword="
    unocss          "https://uno.antfu.me/"
    iconfont        "https://www.iconfont.cn/"
  )

  # check whether the search engine is supported
  if [[ -z "$urls[$1]" ]]; then
    url="${urls[google]}$1"
    open_command "$url"
    return 
  fi

  # search or go to main page depending on number of arguments passed
  if [[ $# -gt 1 ]]; then
    # build search url:
    # join arguments passed with '+', then append to search engine URL
    url="${urls[$1]}$(omz_urlencode ${@[2,-1]})"
    echo $url

  else
    # build main page url:
    # split by '/', then rejoin protocol (1) and domain (2) parts with '//'
    url="${(j://:)${(s:/:)urls[$1]}[1,2]}"
  fi

  open_command "$url"
}


# alias bing='web_search bing'
# alias brs='web_search brave'
# alias google='web_search google'
# alias yahoo='web_search yahoo'
# alias ddg='web_search duckduckgo'
# alias sp='web_search startpage'
# alias yandex='web_search yandex'
# alias github='web_search github'
# alias baidu='web_search baidu'
# alias ecosia='web_search ecosia'
# alias goodreads='web_search goodreads'
# alias qwant='web_search qwant'
# alias givero='web_search givero'
# alias stackoverflow='web_search stackoverflow'
# alias wolframalpha='web_search wolframalpha'
# alias archive='web_search archive'
# alias scholar='web_search scholar'
# alias ask='web_search ask'

#add your own !bang searches here
alias wiki='web_search duckduckgo \!w'
alias news='web_search duckduckgo \!n'
alias youtube='web_search duckduckgo \!yt'
alias map='web_search duckduckgo \!m'
alias image='web_search duckduckgo \!i'
alias ducky='web_search duckduckgo \!'

# other search engine aliases
if [[ ${#ZSH_WEB_SEARCH_ENGINES} -gt 0 ]]; then
  typeset -A engines
  engines=($ZSH_WEB_SEARCH_ENGINES)
  for key in ${(k)engines}; do
    alias "$key"="web_search $key"
  done
  unset engines key
fi
