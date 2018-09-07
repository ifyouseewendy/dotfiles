function git_ahead -a ahead behind diverged none
  not git_is_repo; and return

  set -l commit_count (command git rev-list --count --left-right "@{upstream}...HEAD" ^/dev/null)

  switch "$commit_count"
  case ""
    # no upstream
  case "0"\t"0"
    test -n "$none"; and echo $green "$none"; or echo ""
  case "*"\t"0"
    test -n "$behind"; and echo $normal_color "$behind"; or echo "-"
  case "0"\t"*"
    test -n "$ahead"; and echo $normal_color "$ahead"; or echo "+"
  case "*"
    test -n "$diverged"; and echo $normal_color "$diverged"; or echo "±"
  end
end

function fish_prompt
  set -l theme_short_path 'yes'
  set -l last_command_status $status
  set -l cwd

  if test "$theme_short_path" = 'yes'
    set cwd (basename (prompt_pwd))
  else
    set cwd (prompt_pwd)
  end

  set -l fish     "➜ "
  set -l fail     "✗ "
  set -l ahead    " ↑"
  set -l behind   " ↓"
  set -l diverged " ⥄ "
  set -l dirty    " ✗"
  set -l none     " ✓"
  set -l left     "["
  set -l right    "]"

  set -l normal_color     (set_color normal)
  set -l bold_green       (set_color green --bold)
  set -l green            (set_color green)
  set -l bold_red         (set_color red --bold)
  set -l red              (set_color red)
  set -l bold_white       (set_color white --bold)
  set -l white            (set_color white)
  set -l bold_blue        (set_color blue --bold)
  set -l blue             (set_color blue)

  set -l directory_color  (set_color cyan --bold)

  # show newline
  echo -s "" $normal_color

  # show prompt
  if test $last_command_status -eq 0
    echo -n -s $white $fish $normal_color
  else
    echo -n -s $bold_red $fish $normal_color
  end

  # show directory
  echo -n -s " " $directory_color $cwd $normal_color

  # show ruby version prompt
  echo -n -s " " $bold_blue $left $bold_red $RUBY_VERSION $bold_blue $right $normal_color

  if git_is_repo
    echo -n -s " " $bold_blue $left $bold_red (git_branch_name) $normal_color

    if git_is_touched
      echo -n -s $red $dirty $bold_blue $right $normal_color
    else
      echo -n -s (git_ahead $ahead $behind $diverged $none) $bold_blue $right $normal_color
    end
  end

  echo -s ""
  echo -n -s $white $fish $normal_color " "
end
