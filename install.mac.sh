#!/usr/bin/env bash

### Prep

if [[ "$(uname)" != "Darwin"* ]]; then
  echo "Unsupported system: $(uname)"
  exit 1
fi

### Install utils
UTILS=(direnv ripgrep neovim fzf tig fd diff-so-fancy tmux)

for i in "${UTILS[@]}"
do
  if ! command -v $i &> /dev/null; then
    echo "--> Installing $i"
    brew install $i
  fi
done

### Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### Apply dotfiles

echo "--> Applying dotfiles"
# chezmoi
# sh -c "$(curl -fsLS chezmoi.io/get)" -- init ifyouseewendy --branch=chezmoi --one-shot
ln -svf ~/.dotfiles/fdignore ~/.fdignore
ln -svf ~/.dotfiles/gitconfig ~/.gitconfig
ln -svf ~/.dotfiles/gitignore ~/.gitignore
ln -svf ~/.dotfiles/rgignore ~/.rgignore
ln -svf ~/.dotfiles/ripgreprc ~/.ripgreprc
ln -svf ~/.dotfiles/tigrc ~/.tigrc
ln -svf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -svf ~/.dotfiles/vimrc ~/.vimrc
ln -svf ~/.dotfiles/zshrc ~/.zshrc

### Post hooks

# use customized zsh themes
cp ~/.dotfiles/wendi.zsh-theme ~/.oh-my-zsh/themes/

# neovim
ln -s ~/.vimrc ~/.config/nvim/init.vim

# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim --headless +PlugInstall +qa

# tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
$HOME/.tmux/plugins/tpm/bin/install_plugins
