{ pkgs, ... }: {
  ".editrc".source = ./.editrc;
  ".gitmessage.sample".source = ./git/gitmessage.sample;
  ".inputrc".source = ./.inputrc;
  ".psqlrc".source = ./psql/.psqlrc;
  ".pylintrc".source = ./python/.pylintrc;
  ".xsessionrc".source = ./xsession/.xsessionrc;

  # xinput
  ".xinitrc".source = ./xinput/.xinitrc;
  ".xinputrc".source = ./xinput/.xinputrc;

  # Ruby dotfiles
  ".irbrc".source = ./ruby/.irbrc;
  ".pryrc".source = ./ruby/.pryrc;
  ".rspec".source = ./ruby/.rspec;
  ".rubocop.yml".source = ./rubocop/.rubocop.yml;
  ".rufo".source = ./rufo/.rufo;

  # asdf dotfiles
  ".asdfrc".source = ./asdf/.asdfrc;
  ".default-gems".source = ./asdf/.default-gems;
  ".default-npm-packages".source = ./asdf/.default-npm-packages;
  ".tool-versions".source = ./asdf/tool-versions;

  # haskell dotfiles
  ".ghci".source = ./haskell/.ghci;
  ".haskeline".source = ./haskell/.haskeline;
  ".hindent.yaml".source = ./haskell/.hindent.yaml;
  ".stylish-haskell.yaml".source = ./haskell/.stylish-haskell.yaml;
  ".summoner.toml".source = ./haskell/.summoner.toml;
  "floskell.json".source = ./haskell/floskell.json;

  # tmuxinantor
  ".tmuxinator/personal.yml".source = ./tmuxinator/personal.yml;

  # mdl
  ".mdlrc".source = ./mdl/.mdlrc;
  "mdl/style.rb".source = ./mdl/style.rb;

  "dircolors.nord".source = pkgs.fetchFromGitHub {
    owner = "arcticicestudio";
    repo = "nord-dircolors";
    rev = "master";
    sha256 = "1c9fa6dip266z6hfqd5nan5v6qjp6dg074lvk4rxisirm26djlzz";
  } + "/src/dir_colors";

  # Hammerspoon
  ".hammerspoon/init.lua".source = ./hammerspoon/init.lua;

  # Slate: Deprecated, use Hammerspoon
  # ".slate".source = ./slate/.slate;

  # curl
  ".curlrc".source = ./curl/curlrc;

  # gradle
  ".gradle/gradle.properties".source = ./gradle/gradle.properties;

  # ideavimrc
  ".ideavimrc".source = ./idea/ideavimrc;

  # ruby-version
  ".ruby-version".source = ./ruby-version/.ruby-version;

  # detekt
  "detekt.yaml".source = ./detekt/detekt.yaml;
}
