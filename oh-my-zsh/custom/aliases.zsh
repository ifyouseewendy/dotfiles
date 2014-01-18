alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias rm='trash'
alias tigs='tig status'
alias rb='rbenv'
alias be='bundle exec'
alias pt='pstree'
alias bi='bundle install --path=vendor/bundle --binstubs=.binstubs'
alias gi='gem install'
alias vless='/usr/share/vim/vim73/macros/less.sh'

alias h='history'
alias g='git status'

alias tm='open -a /Applications/TextMate.app'
alias mvim='open -a /Applications/MacVim.app'
# alias dman='open dash://{query}'

alias crontab="VIM_CRONTAB=true crontab"

# auto open gz by tar
alias -s gz='tar -xzvf'

alias pre='qlmanage -p'

alias tailf='tail -f'

alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

