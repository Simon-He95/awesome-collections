<span><div align="center">![picture](/images/kv.png)</div></span>

## Linux terminal

[settings](./linux/settings.json)

![ubuntu](/images/terminal.png 'ubuntu terminal')

## GitHub CI/CD

[settings](./workflows/ci.yml)

## ZSH

```bash
theme:  spaceship
plugins:  git web-search zsh-autosuggestions zsh-autocomplete zsh-z last-working-dir zsh-syntax-highlighting
```

[settings](./zshrc/.zshrc)

![ZSH](/images/vscode.png 'zsh terminal')

## Code Snippet

[javascript](./code-snippet/javascript.json)

[typescript](./code-snippet/typescript.json)

[vue](./code-snippet/vue.json)

[javascriptreact](./code-snippet/javascriptreact.json)

[typescriptreact](./code-snippet/typescriptreact.json)

## Alfred

[Alfred 5 crack version tool](./Alfred/Alfred5/Alfred_PowerPack_5.0.4.2092__iMacSO.com.dmg)

[Useful workflows](./Alfred/workflows/)

## web-search

https://user-images.githubusercontent.com/57086651/203928145-0f3469f0-ac8a-4c07-a83b-580b8a3e2dd7.mov

## How to install plugins

- sh -c "$(curl -fsSL https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh)" && rm -rf install.sh
- git clone https://gitee.com/mirrors_marlonrichert/zsh-autocomplete.git ~/.oh-my-zsh/custom/plugins/zsh-autocomplete
- git clone https://gitee.com/yanzhongqian/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
- git clone https://gitee.com/lightnear/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
- git clone https://gitee.com/github-mirror-zsh/zsh-z.git ~/.oh-my-zsh/custom/plugins/zsh-z
- git clone https://gitee.com/xiaoqqya/spaceship-prompt.git "~/.oh-my-zsh/custom/themes/spaceship-prompt" --depth=1 && ln -s "${customTheme}spaceship-prompt/spaceship.zsh-theme" "${customTheme}/spaceship.zsh-theme"

## [More zsh plugins](/zshrc/.oh-my-zsh/)

## :coffee:

<a href="https://github.com/Simon-He95/sponsor" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" style="height: 51px !important;width: 217px !important;" ></a>

## Detail

- git config --global core.editor vim // 将 git 的文本编辑器改 vim

## License

[MIT](./license)
