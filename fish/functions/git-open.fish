function git-open
  set -l host (git remote -v | grep -Eo 'github.com[:/][^.]+' | head -1 | tr : /)
  open https://$host/commit/$argv
end
