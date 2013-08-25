# derived from josh.zsh-theme

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}*%{$fg[blue]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

function josh_prompt {
  (( spare_width = ${COLUMNS} ))
  prompt=" "

  branch=$(current_branch)
  ruby_version=$(rvm_prompt_info || rbenv_prompt_info)
  path_size=${#PWD}
  branch_size=${#branch}
  ruby_size=${#ruby_version}
  # user_machine_size=${#${(%):-%n@%m-}}
  user_machine_size=${#${-%m-}}

  if [[ `pwd` =~ "/Users/wendi" ]] ; then
    (( path_size = path_size - 11 ))
  else
  fi

  if [[ ${#branch} -eq 0 ]]
    then (( ruby_size = ruby_size + 1 ))
  else
    (( branch_size = branch_size + 4 ))
    if [[ -n $(git status -s 2> /dev/null) ]]; then
      (( branch_size = branch_size + 2 ))
    fi
  fi

  (( spare_width = ${spare_width} - ( 2 + ${user_machine_size} + ${path_size} + ${branch_size} + ${ruby_size}) ))

  while [ ${#prompt} -lt $spare_width ]; do
    prompt=" $prompt"
  done

  # prompt="%{%F{green}%}$PWD$prompt%{%F{red}%}$(rvm_prompt_info || rbenv_prompt_info)%{$reset_color%} $(git_prompt_info)"
  prompt="%{$fg_bold[red]%}➜  %m%{$fg_bold[green]%}%p %{$fg[cyan]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}$prompt%{$fg_bold[red]%}$(rvm_prompt_info || rbenv_prompt_info)%{$fg_bold[red]%}"

  echo $prompt
}

setopt prompt_subst

PROMPT='
$(josh_prompt)
%(?,%{$fg_bold[red]%},%{$fg_bold[green]%})➜%{$reset_color%}  '

