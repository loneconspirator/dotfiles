alias fsd="foreman start -f Procfile.dev"
alias bi="bundle install"
alias gce='gh copilot explain'
alias gcm='git checkout master'
alias gcs='gh copilot suggest'
alias ss='spring stop'
alias tc='rm -rf tmp/cache'
alias dblt='RAILS_ENV=test bundle exec rails db:schema:load'
alias dbm='bundle exec rails db:migrate ; dblt'
alias dbr='bundle exec rails db:rollback ; dblt'
alias kc='killall chromedriver; killall "Google Chrome"'

alias cdip="cd ~/git/InPlay"

compdef g=git
function g {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status --short --branch
  fi
}

function mv_model {
  mv app/models/"$1".rb app/models/"$2".rb
  mv spec/models/"$1"_spec.rb spec/models/"$2"_spec.rb
}
