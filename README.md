## About

After using Larry's Dotfile for a really long time, I've learned to configure vim, tmux, zsh and many other dev tools. THANKS so much. :kissing_heart:

Check [Larry's Dotfile](https://github.com/larrylv/dotfiles) for details.

## Quick setup

Linux

```
./install.sh
```

Mac

```
./install.mac.sh
```

## Usage

Prep

```
git clone git@github.com:ifyouseewendy/dotfiles.git ~/.dotfiles
```

### zsh

Install [oh-my-zsh](https://ohmyz.sh/#install)

Configure zsh
```
cp ~/.dotfiles/wendi.zsh-theme ~/.oh-my-zsh/themes/
```

Install [direnv](https://direnv.net/)

```
brew install direnv
```

Install [ripgrep](https://github.com/BurntSushi/ripgrep)

```
brew install ripgrep && ln -svf ~/.dotfiles/ripgreprc ~/.ripgreprc
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

Install tig
```
brew install tig
ln -svf ~/.dotfiles/tigrc ~/.tigrc
```

Install [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)
```
brew install diff-so-fancy
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

Install [fzf](https://github.com/junegunn/fzf)

```
brew install fzf
```

Install [fd](https://github.com/sharkdp/fd)
```
brew install fd
```

Configure

```
ln -svf ~/.dotfiles/vimrc ~/.vimrc

vim .vimrc

	:PlugInstall
```

### tmux

```
ln -svf $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
$HOME/.tmux/plugins/tpm/bin/install_plugins
```

