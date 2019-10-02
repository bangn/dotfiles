# use these aliases to turn your local database servers on & off

if [ "$(uname)" = "Darwin" ];
then
  alias pgof='launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'
  alias pgon='launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'

  alias msof='launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'
  alias mson='launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'

  alias mgof='launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist'
  alias mgon='launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist'

  alias rdof='launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.redis.plist'
  alias rdon='launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.redis.plist'

  alias mcof='launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist'
  alias mcon='launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist'

  alias rbon='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.rabbitmq.plist'
  alias rbof='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.rabbitmq.plist'

  alias caon='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.cassandra.plist'
  alias caof='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.cassandra.plist'
fi
