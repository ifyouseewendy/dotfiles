# fish
set fish_greeting "Hello mate, welcome to Fish!"

# env
set -x EDITOR "nvim"

# system
ulimit -Sn 4096

# dev tool
if test -e /opt/dev/dev.fish
  source /opt/dev/dev.fish
end

# fzf
source "/usr/local/opt/fzf/shell/key-bindings.fish"
# set -x FZF_DEFAULT_OPTS "--bind='ctrl-o:execute(code {})+abort'"
set -x FZF_DEFAULT_OPTS '--reverse --bind ctrl-d:page-down,ctrl-u:page-up'
set -x FZF_TMUX 1
set -x FZF_TMUX_HEIGHT 30%
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -x FZF_DEFAULT_COMMAND 'ag -g ""'

# fasd
alias a='fasd -a'        # any
# alias s='fasd -si'       # show / search / select
# alias d='fasd -d'        # directory
alias v='fasd -f -t -e nvim'        # file
alias vv='fasd -f -i -t -e nvim'        # file
# alias sd='fasd -sid'     # interactive directory selection
# alias sf='fasd -sif'     # interactive file selection
alias j='fasd_cd -d'     # cd, same functionality as j in autojump
alias jj='fasd_cd -d -i' # cd with interactive selection

# directory operations
alias l='exa --group-directories-first' # 'ls -CF'
alias la='exa -all --group-directories-first' # 'ls -AF'
alias ll='exa --all --long --grid --group --group-directories-first --color=automatic' # 'ls -alhF'
alias ..='cd ..'         # Go up one directory
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up three directories

# docker
alias dk="docker"
alias dp="docker ps -a"
alias dc="docker-compose"
alias dm="docker-machine"
# eval (docker-machine env default)

# ruby
alias bi='bundle install --path=vendor/bundle --binstubs .bundle/bin'
alias be='bundle exec'
alias ri='ri -f ansi'
# source /usr/local/share/chruby/auto.fish
# source /usr/local/share/chruby/chruby.fish

# haskell
set -U fish_user_paths $HOME/.local/bin $HOME/Library/Haskell/bin/

# Go
set -x -U GOPATH $HOME/Workspace/go
set -U fish_user_paths $HOME/Workspace/go/bin

# C
set -x -U SDKROOT /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk

# command alias
alias tigs='tig status'
alias g='git status'
alias h='history'
alias vi='nvim'
alias vim='nvim'
alias vif='nvim (fzf)'
alias pre='open -a Preview'
alias tailf='tail -f'
alias lessf='less +F'
alias cat='bat'
alias ping='prettyping --nolegend'
alias quickview="fzf --preview 'bat --color \"always\" {}'"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias vcf="vim ~/.config/fish/config.fish"

# dev
alias ffs="dev down; dev up; dev s"
alias push-pr="git push -u origin HEAD --no-verify; dev open pr"
set -x PKG_CONFIG_PATH /usr/local/opt/imagemagick@6/lib/pkgconfig

# NOTE
#
# How to run something like `FOO=BAR dev s`?
#
#   1. begin; set -lx FOO BAR; dev s; end
#   2. env FOO=BAR fish -c "dev s"

# direnv
direnv hook fish | source

# Wasmer
# export WASMER_DIR="/Users/wendi/.wasmer"
# [ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# LLVM
set -g fish_user_paths "/usr/local/opt/llvm/bin/" $fish_user_paths
set -e LDFLAGS
set -gx CPPFLAGS "-I/usr/local/opt/llvm/include -I/usr/local/opt/llvm/include/c++/v2/ -I/usr/local/include"
set -gx CPATH "/usr/local/include" $CPATH
