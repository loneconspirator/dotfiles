alias git=hub

alias fsd="foreman start -f Procfile.dev"
alias bi="bundle install"
alias gcm='git checkout master'

compdef g=git
function g {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status --short --branch
  fi
}

alias gcm='git checkout master'
