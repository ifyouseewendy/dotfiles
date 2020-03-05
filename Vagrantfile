# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "hashicorp/bionic64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder ".", "/vagrant/"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
    vb.name = "my-dev-box"

    # Customize the amount of memory on the VM:
    vb.memory = 1*1024
    vb.cpus = 2
  end

  # https://github.com/dotless-de/vagrant-vbguest
  # vagrant plugin install vagrant-vbguest
  config.vbguest.auto_update = true

  # https://github.com/tmatilai/vagrant-timezone
  # vagrant plugin install vagrant-timezone
  if Vagrant.has_plugin?("vagrant-timezone")
    config.timezone.value = "EST"
  end

  # View the documentation for the provider you are using for more
  # information on available options.

  # Run: ssh-add ~/.ssh/YOUR_RSA
  config.ssh.forward_agent = true
  # https://bitboxer.de/2017/08/06/ssh-with-clipboard/
  config.ssh.forward_x11 = true

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    echo "Start setting up dev env"

    echo "==> cd $HOME"
    cd $HOME

    echo "==> configuring ssh"
    ssh-keyscan github.com >> ~/.ssh/known_hosts
    ssh -T git@github.com

    echo "==> clone dotfiles"
    if [[ -d $HOME/.dotfiles ]]; then
      echo ".dotfiles exists"
    else
      git clone https://github.com/ifyouseewendy/dotfiles.git $HOME/.dotfiles
    fi

    echo "==> configure bash"
    ln -svf $HOME/.dotfiles/bashrc $HOME/.bashrc

    echo "==> configure git"
    ln -svf $HOME/.dotfiles/gitconfig $HOME/.gitconfig
    ln -svf $HOME/.dotfiles/gitignore $HOME/.gitignore
    ln -svf $HOME/.dotfiles/tigrc $HOME/.tigrc

    # https://github.com/so-fancy/diff-so-fancy
    if [[ -n $(which diff-so-fancy) ]]; then
      "diff-so-fancy exists"
    else
      wget -q https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
      chmod +x diff-so-fancy && sudo mv diff-so-fancy /usr/local/bin/diff-so-fancy
    fi

    echo "==> apt-get update"
    export DEBIAN_FRONTEND=noninteractive
    sudo apt-get update >/dev/null

    echo "==> install python" # for https://github.com/Shougo/deoplete.nvim
    if [[ -n $(which python) ]]; then
      echo "python exists"
    else
      sudo apt-get install -y python-dev python3-dev >/dev/null
    fi
    if [[ -n $(which pip3) ]]; then
      echo "pip3 exists"
    else
      sudo apt-get install -y python-pip python3-pip >/dev/null
      pip3 install --user pynvim >/dev/null
    fi

    echo "==> install ruby-install"
    if [[ -n $(which ruby-install) ]]; then
      echo "ruby-install exists"
    else
      cd $HOME
      mkdir tmp && cd tmp
      # https://github.com/postmodern/ruby-install#install
      wget -q -O ruby-install-0.7.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.7.0.tar.gz
      tar -xzvf ruby-install-0.7.0.tar.gz >/dev/null
      cd ruby-install-0.7.0/
      sudo make install >/dev/null
      which ruby-install
      cd $HOME/tmp
      rm ruby-install-0.7.0.tar.gz
      rm -rf ruby-install-0.7.0
      cd $HOME
    fi

    echo "==> install ruby"
    if [[ -d ~/.rubies/ruby-2.7.0 ]]; then
      echo "ruby exists"
    else
      ruby-install -s tmp ruby 2.7.0 >/dev/null 2>&1
      cd $HOME/tmp
      rm ruby-2.7.0.tar.bz2
      rm -rf ruby-2.7.0
      cd $HOME
    fi

    echo "==> install chruby"
    if [[ -e ~/.ruby-version ]]; then
      echo "chruby exists"
    else
      cd $HOME/tmp
      wget -q -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
      tar -xzvf chruby-0.3.9.tar.gz >/dev/null
      cd chruby-0.3.9/
      sudo make install >/dev/null
      cd $HOME/tmp
      rm chruby-0.3.9.tar.gz
      rm -rf chruby-0.3.9/
      echo "ruby-2.7.0" > ~/.ruby-version
      cd $HOME
    fi

    echo "==> install rust"
    if [[ -n $(which rustup) ]]; then
      echo "rustup exists"
    else
      # https://forge.rust-lang.org/infra/other-installation-methods.html
      curl https://sh.rustup.rs -sSf | sh -s -- -y -q --default-toolchain nightly --profile complete >/dev/null 2>&1
      source $HOME/.cargo/env
      rustup show
    fi

    echo "==> configure tmux"
    if [[ -e $HOME/.tmux.conf ]]; then
      echo ".tmux.conf exists"
    else
      ln -svf $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
    fi
    if [[ -d $HOME/.tmux/plugins/tpm ]]; then
      echo "tpm exsits"
    else
      git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
      $HOME/.tmux/plugins/tpm/bin/install_plugins
    fi

    echo "==> install neovim"
    # Existing version is kinda old
    if [[ -n $(which nvim) ]] && [[ -n $(nvim --version | grep "v0.3") ]]; then
      echo "neovim exists"
    else
      sudo apt-get install -y software-properties-common >/dev/null
      sudo add-apt-repository -y ppa:neovim-ppa/stable >/dev/null
      sudo apt-get -y update >/dev/null
      sudo apt-get -y install neovim >/dev/null
    fi
    echo "==> configure neovim"
    mkdir -p $HOME/.config/nvim
    if [[ -e $HOME/.config/nvim/init.vim ]]; then
      echo "init.vim exists"
    else
      cat <<- EOF > $HOME/.config/nvim/init.vim
      set runtimepath^=~/.vim runtimepath+=~/.vim/after
      let &packpath = &runtimepath
      source ~/.vimrc
EOF
    fi

    if [[ -e $HOME/.vimrc ]]; then
      echo ".vimrc exists"
    else
      ln -svf $HOME/.dotfiles/vimrc $HOME/.vimrc
    fi

    echo "==> install vim-plug"
    if [[ -e $HOME/.local/share/nvim/site/autoload/plug.vim ]]; then
      echo "vim-plug exists"
    else
      curl --silent -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim >/dev/null
      nvim --headless +PlugInstall +qall >/dev/null 2>&1
    fi

    echo "==> install fzf"
    if [[ -d ~/.fzf ]]; then
      echo "fzf exists"
    else
      git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
      ~/.fzf/install --all >/dev/null 2>&1
    fi

    echo "==> install fasd"
    if [[ -n $(which fasd) ]]; then
      echo "fasd exists"
    else
      sudo add-apt-repository -y ppa:aacebedo/fasd >/dev/null 2>&1
      sudo apt-get -y update >/dev/null 2>&1
      sudo apt-get -y install fasd >/dev/null 2>&1
    fi

    echo "==> install exa"
    if [[ -n $(which exa) ]]; then
      echo "exa exists"
    else
      cargo install exa >/dev/null 2>&1
    fi

    echo "==> install tig"
    if [[ -n $(which tig) ]]; then
      echo "tig exists"
    else
      cd $HOME/tmp
      wget -q -O tig-2.5.0.tar.gz https://github.com/jonas/tig/releases/download/tig-2.5.0/tig-2.5.0.tar.gz
      tar -xzvf tig-2.5.0.tar.gz >/dev/null
      cd tig-2.5.0/
      make prefix=/usr/local >/dev/null 2>&1
      sudo make install prefix=/usr/local >/dev/null
      cd $HOME/tmp
      rm tig-2.5.0.tar.gz
      rm -rf tig-2.5.0/
      cd $HOME
    fi

    echo "==> install direnv"
    if [[ -n $(which direnv) ]]; then
      echo "direnv exists"
    else
      curl -sfL https://direnv.net/install.sh | bash
    fi
    # add ripgrep

    echo "==> install bash-git-prompt"
    if [[ -d $HOME/.bash-git-prompt ]]; then
      echo "bash-git-prompt exists"
    else
      git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
      ln -svf $HOME/.dotfiles/git-prompt-colors.sh $HOME/.git-prompt-colors.sh
    fi
  SHELL
end
