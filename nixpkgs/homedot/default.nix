{ pkgs, ... }:
{
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

  # asdf dotfiles
  ".asdfrc".source = ./asdf/.asdfrc;
  ".default-gems".source = ./asdf/.default-gems;
  ".default-npm-packages".source = ./asdf/.default-npm-packages;
  ".tool-versions".source = ./asdf/tool-versions;

  # tmuxinantor
  ".tmuxinator/afterpay.yml".source = ./tmuxinator/afterpay.yml;

  # mdl
  ".mdlrc".source = ./mdl/.mdlrc;
  "mdl/style.rb".source = ./mdl/style.rb;

  # rubocop
  ".rubocop.yml".source = ./rubocop/.rubocop.yml;

  "dircolors.nord".source = pkgs.fetchFromGitHub
    {
      owner = "arcticicestudio";
      repo = "nord-dircolors";
      rev = "master";
      sha256 = "1c9fa6dip266z6hfqd5nan5v6qjp6dg074lvk4rxisirm26djlzz";
    } + "/src/dir_colors";
}
