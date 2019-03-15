# Path to the bash it configuration
export BASH_IT="/Users/wendi/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='wendi'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
# export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
# export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Load Bash It
source $BASH_IT/bash_it.sh

# Keep in mind how Bash load its configuration files,
#   + .bash_profile for login shells (and in Mac OS X in terminal emulators like Termminal.app or iTerm2)
#   + .bashrc for interactive shells (default mode in most of the GNU/Linux terminal emulators)
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Set for projects.plugin.bash
export PROJECT_PATHS=/Users/wendi/Workspace

export EDITOR='nvim'

# Enable neovim true color
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Support dev
if [[ -f /opt/dev/dev.sh ]]; then source /opt/dev/dev.sh; fi

# Enable fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS='--reverse --bind ctrl-d:page-down,ctrl-u:page-up'
export FZF_TMUX=1
export FZF_TMUX_HEIGHT=30%
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND='ag -g ""'

# Enable yarn global
export PATH="`yarn global bin`:$PATH"

# Set up default docker-machine
eval $(docker-machine env default)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/wendi/Workspace/google-cloud-sdk/path.bash.inc' ]; then source '/Users/wendi/Workspace/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/wendi/Workspace/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/wendi/Workspace/google-cloud-sdk/completion.bash.inc'; fi

export PATH="$HOME/.local/bin:$HOME/Library/Haskell/bin/:$PATH"

if [ -f ~/.config/exercism/exercism_completion.bash ]; then
  . ~/.config/exercism/exercism_completion.bash
fi

if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv init - && pyenv virtualenv-init -)"; fi

export PYENV_ROOT="$HOME/.pyenv"

ulimit -Sn 4096

export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
# brew unlink imagemagick
# brew install imagemagick@6 && brew link imagemagick@6 --force

export PKG_CONFIG_PATH=/usr/local/Cellar/imagemagick@6/6.9.10-9/lib/pkgconfig

export PATH="$HOME/.cargo/bin:$PATH"
