#! /bin/bash
alias b='bundle'
alias bo='bundle open'
alias be='bundle exec'
alias berk='bundle exec rake'

ber() {
  bundle exec rspec "${@:-./spec}"
}
