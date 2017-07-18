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
