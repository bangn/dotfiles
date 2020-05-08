alias rv='ruby -v'

# delete all gems; then install latest rake, bundler, etc.
gemclear() {
  for i in $(gem list --no-versions); do
    gem uninstall -aIx "$i"
  done
}

gem_refresh() {
  gemclear
  gem install rake bundler rspec
  if [ -e "./Gemfile" ]; then
    bundle install
  fi
}
