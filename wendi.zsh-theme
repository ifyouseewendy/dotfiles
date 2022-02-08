# derived from josh.zsh-theme

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}*%{$fg[blue]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

function wendi_prompt {
  prompt_flag="%{$fg_bold[red]%}➜"
  relative_dir="%{$fg[cyan]%}%1/"
  git_branch="%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}"
  prompt="${prompt_flag} ${relative_dir} ${git_branch}"

  echo $prompt
}

setopt prompt_subst

PROMPT='
$(wendi_prompt)
%(?,%{$fg_bold[red]%},%{$fg_bold[green]%})➜%{$reset_color%} '
