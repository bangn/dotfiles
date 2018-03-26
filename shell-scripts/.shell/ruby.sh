alias rv='ruby -v'

# delete all gems; then install latest rake, bundler, etc.
gemclear () {
  for i in $(gem list --no-versions); do
    gem uninstall -aIx "$i"
  done
}

gem_refresh() {
  gemclear
  gem install rake bundler rspec # fuubar rubygems-bundler zeus
  if [ -e "./Gemfile" ]; then
    bundle install
  fi
}

gemack () {
  ack --type=ruby "$@" "$GEM_HOME"
}

rake_secret() {
  ruby -r securerandom -e "p SecureRandom.hex(128)"
}
