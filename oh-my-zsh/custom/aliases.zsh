alias ll='ls -alF'
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
function gg() {
  git commit -v -a -m "$*"
}

# safely rm
mkdir -p ~/.Trash
alias rm=trash
alias urm=untrash
alias rl="ls ~/.Trash"

trash()
{
  mv $@ --verbose -f --backup=numbered --target-directory ~/.Trash/
}

untrash()
{
  mv -i --verbose ~/.Trash/$@ ./
}

cleartrash()
{
  read -p "clear sure?[n]" confirm
  [ $confirm == 'y' ] || [ $confirm == 'Y' ]  && /usr/bin/rm -rf ~/.Trash/*
}
