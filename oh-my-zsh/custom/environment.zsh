# zsh
unsetopt correct_all

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=HISTSIZE

# MacPorts is uninstalled, so no need to add `/opt/local/bin` to $PATH
# [[ -s "/opt/local/bin" ]] && export PATH=/opt/local/bin:$PATH
[[ -s "/usr/local/bin" ]] && export PATH=/usr/local/bin:$PATH
[[ -s "/usr/local/sbin" ]] && export PATH=/usr/local/sbin:$PATH
[[ -s "/sbin" ]] && export PATH=/sbin:$PATH

# I dropped rvm a few days ago, so shell won't add append BUNDLE_BIN path to the
# PATH when changing directories. And I always use `--binstubs=.binstubs`
# option for bundler. So it will be great to add `.binstubs` to the PATH.
# Thank god I won't type `bundle exec` or its alias `be` any more.
export PATH=.binstubs:$PATH

export EDITOR=vim

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# export RUBY_GC_MALLOC_LIMIT=90000000
# export RUBY_FREE_MIN=200000

export PGHOST=localhost

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

# Set the environment variable for the docker daemon
export DOCKER_HOST=tcp://localhost:4243

export PATH=/usr/local/git/bin:/usr/local/sbin:$PATH

export GOPATH=$HOME/Workspace/go/packages
export GOROOT=/usr/local/Cellar/go/1.2.1/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

