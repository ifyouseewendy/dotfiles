#!/usr/bin/env bash

### Prep

if [[ "$(uname)" == "Darwin" ]]; then
  if ! command -v brew -f &> /dev/null; then
    echo "No proper installer found. Please install homebrew"
    exit 1
  fi

  INSTALLER="brew install"
elif [[ "$(uname)" == "Linux"* ]]; then
  export PATH=/home/spin/.nix-profile/bin:$PATH

  if ! command -v nix-env -f &> /dev/null; then
    echo "No proper installer found. Please install Nix"
    exit 1
  fi

  INSTALLER="nix-env -f '<nixpkgs>' -iA"
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
