alias fsd="foreman start -f Procfile.dev"
alias bi="bundle install"
alias gcm='git checkout master'
alias ss='spring stop'
alias tc='rm -rf tmp/cache'
alias dbm='bundle exec rails db:migrate ; RAILS_ENV=test bundle exec rails db:migrate'
alias dbr='bundle exec rails db:rollback ; RAILS_ENV=test bundle exec rails db:rollback'

compdef g=git
function g {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status --short --branch
  fi
}
