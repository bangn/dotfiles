alias rddm='rake db:drop; rake db:create; rake db:migrate'
alias rdm='rake db:migrate'
alias rds='rake db:seed'
alias rdtp='rake db:test:prepare'
alias rdsl='rake db:structure:load'

# reset development database
resetdb() {
  bundle exec rake db:drop db:create db:migrate db:seed
  bundle exec rake db:test:prepare
}
