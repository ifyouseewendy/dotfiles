## About

After using Larry's Dotfile for a really long time, I've learned to configure vim, tmux, zsh and many other dev tools. THANKS so much. :kissing_heart:

Check [Larry's Dotfile](https://github.com/larrylv/dotfiles) for details on

+ Vim (Ruby support mainly)
+ Git
+ Tmux
+ Fish

## Shell setup

Soft link `fish/config.fish` and `fish/functions` to your local fish configs, which is `~/.config/fish/` in my local.

## Vim Setup

+ Create vimrc by `curl https://raw.githubusercontent.com/ifyouseewendy/dotfiles/master/vimrc -o ~/.vimrc`
+ [Install Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim). To let nvim use vim config, create `~/.config/nvim/init.vim` with these contents:

```vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```

+ [Install vim-plug](https://github.com/junegunn/vim-plug#neovim)  as vim plugin manager
+ Open file by neovim, and input `:PlugInstall`.
+ Install external dependency (optional)
  + [junegunn/fzf](https://github.com/junegunn/fzf)
