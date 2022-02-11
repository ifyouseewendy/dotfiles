#!/usr/bin/env bash

### Prep

if [[ "$(uname)" != "Linux"* ]]; then
  echo "Unsupported system: $(uname)"
  exit 1
fi

### Install utils
UTILS=(direnv ripgrep neovim fzf tig)

for i in "${UTILS[@]}"
do
  if ! command -v $i &> /dev/null; then
    echo "--> Installing $i"
    sudo apt-get install -y $i -o DPkg::Lock::Timeout=600
  fi
done

# fd
if ! command -v fdfind &> /dev/null; then
  echo "--> Installing fdfind"
  sudo apt-get install -y fd-find -o DPkg::Lock::Timeout=600
  sudo ln -svf /usr/bin/fdfind /usr/bin/fd
fi

# diff-so-fancy
if ! command -v diff-so-fancy &> /dev/null; then
  echo "--> Installing diff-so-fancy"
  sudo add-apt-repository -y ppa:aos1/diff-so-fancy
  sudo apt-get update -o DPkg::Lock::Timeout=600
  sudo apt-get install -y diff-so-fancy -o DPkg::Lock::Timeout=600
fi


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
