#!/usr/bin/env bash

### Prep

if [ "$(uname)" == "Darwin" ]; then
  INSTALLER="brew install"
elif [ "$(uname)" == "Linux" ]; then
  INSTALLER="nix-env -f '<nixpkgs>'"
else
  echo "Unsupported system: $(uname)"
  exit 1
fi

### Install utils

UTILS=(direnv ripgrep neovim fzf fd tig diff-so-fancy chezmoi)

for i in "${UTILS[@]}"
do
  $(echo "$INSTALLER $i")
done

### Apply dotfiles

chezmoi init https://github.com/ifyouseewendy/dotfiles.git --branch=chezmoi
chezmoi apply

### Post hooks
# neovim
ln -s ~/.vimrc ~/.config/nvim/init.vim

# vim-plug
nvim --headless +PlugInstall +qa

# tpm
$HOME/.tmux/plugins/tpm/bin/install_plugins
