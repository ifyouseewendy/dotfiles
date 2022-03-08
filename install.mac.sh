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

### Apply dotfiles

# chezmoi
sh -c "$(curl -fsLS chezmoi.io/get)" -- init ifyouseewendy --branch=chezmoi --one-shot

### Post hooks
# neovim
ln -s ~/.vimrc ~/.config/nvim/init.vim

# vim-plug
nvim --headless +PlugInstall +qa

# tpm
$HOME/.tmux/plugins/tpm/bin/install_plugins
