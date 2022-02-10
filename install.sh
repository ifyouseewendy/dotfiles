#!/usr/bin/env bash

### Prep

if [[ "$(uname)" == "Darwin" ]]; then
  if ! command -v brew -f &> /dev/null; then
    echo "No proper installer found. Please install homebrew"
    exit 1
  fi

  INSTALLER="brew install"
elif [[ "$(uname)" == "Linux"* ]]; then

  n=1
  while [[ $n -le 10 ]] && ! command -v nix-env -f &> /dev/null
  do
    echo "--> Cannot find nix-env, sleep 5s"
    sleep 5
    n=$(( n+1 ))	 # increments $n
  done

  if ! command -v nix-env -f &> /dev/null; then
    echo "No proper installer found. Please install Nix"
    exit 1
  fi

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
