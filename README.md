## About

After using Larry's Dotfile for a really long time, I've learned to configure vim, tmux, zsh and many other dev tools. THANKS so much. :kissing_heart:

Check [Larry's Dotfile](https://github.com/larrylv/dotfiles) for details.

## Dev env

* [zsh](https://www.zsh.org/) with [oh-my-zsh](https://ohmyz.sh/)
* [git](https://git-scm.com/) with [tig](https://github.com/jonas/tig), and [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)
* [neovim](https://neovim.io/) with [vim-plug](https://github.com/junegunn/vim-plug#unix-linux) and plugins defined in [vimrc](./vimrc)
* [tmux](https://github.com/tmux/tmux) with [tpm](https://github.com/tmux-plugins/tpm)
* Others
  - [direnv](https://direnv.net/)
  - [ripgrep](https://github.com/BurntSushi/ripgrep)
  - [fzf](https://github.com/junegunn/fzf)
  - [fd](https://github.com/sharkdp/fd)

## Installation

Preparation

```
git clone git@github.com:ifyouseewendy/dotfiles.git ~/.dotfiles
```

Use package managers, such as apt, [homebrew](https://brew.sh/), or [Nix](https://nixos.org/download.html) at your ease


### zsh

Install [oh-my-zsh](https://ohmyz.sh/#install)

Configure zsh
```
cp ~/.dotfiles/wendi.zsh-theme ~/.oh-my-zsh/themes/
```

Use theme

```
ln -svf ~/.dotfiles/wendi.zsh-theme ~/.oh-my-zsh/themes/wendi.zsh-theme
```

Link zshrc

```
ln -svf ~/.dotfiles/zshrc ~/.zshrc
```

### git

Install [tig](https://github.com/jonas/tig)

```
nix-env -iA nixpkgs.tig
```

Configure

```

ln -svf ~/.dotfiles/tigrc ~/.tigrc
```

Install [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)

```
brew install diff-so-fancy
nix-env -iA nixpkgs.diff-so-fancy
```

Configure

```
ln -svf ~/.dotfiles/gitconfig.shop ~/.gitconfig
ln -svf ~/.dotfiles/gitignore ~/.gitignore
```

### vim

Install [Neovim](https://neovim.io/)

```
brew install neovim
nix-env -iA nixpkgs.neovim

mkdir -p ~/.config/nvim
vim ~/.config/nvim/init.vim

	set runtimepath^=~/.vim runtimepath+=~/.vim/after
	let &packpath = &runtimepath
	source ~/.vimrc
```

Install [vim-plug](https://github.com/junegunn/vim-plug#unix-linux)
```
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Configure

```
ln -svf ~/.dotfiles/vimrc ~/.vimrc

vim .vimrc

	:PlugInstall
```

### tmux

Install

```
brew install tmux
nix-env -iA nixpkgs.tmux
```

Configure

```
ln -svf $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
$HOME/.tmux/plugins/tpm/bin/install_plugins
```

### Others

Install [direnv](https://direnv.net/)

```
brew install direnv
nix-env -iA nixpkgs.direnv
```

Install [ripgrep](https://github.com/BurntSushi/ripgrep)

```
brew install ripgrep
nix-env -iA nixpkgs.ripgrep

ln -svf ~/.dotfiles/ripgreprc ~/.ripgreprc
```


Install [fzf](https://github.com/junegunn/fzf)

```
brew install fzf
nix-env -iA nixpkgs.fzf
```

Install [fd](https://github.com/sharkdp/fd)
```
brew install fd
nix-env -iA nixpkgs.fd
```

