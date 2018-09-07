# fish
set fish_greeting "Hello mate, welcome to Fish!"

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

# directory operations
alias la='ls -AF'
alias ll='ls -alhF'
alias l='ls -CF'
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

# haskell
set -U fish_user_paths $HOME/.local/bin $HOME/Library/Haskell/bin/ $fish_user_paths

# command alias
alias tigs='tig status'
alias g='git status'
alias f='open -a Finder '
alias h='history'
alias vim='nvim'
alias vif='nvim (fzf)'
alias pre='open -a Preview'
alias tailf='tail -f'
alias lessf='less +F'
alias cat='bat'
alias cleardns="sudo killall -HUP mDNSResponder"
alias flush='dscacheutil -flushcache'
alias pt='pstree'
alias ping='prettyping --nolegend'
alias quickview="fzf --preview 'bat --color \"always\" {}'"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias crontab="VIM_CRONTAB=true crontab"
# alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
# alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# dev
alias ffs="dev down and dev up and dev s"
alias push-pr="git push -u origin HEAD --no-verify and dev open pr"
set -x PKG_CONFIG_PATH (brew --prefix imagemagick@6)/6.9.10-9/lib/pkgconfig
