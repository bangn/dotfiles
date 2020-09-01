{ pkgs, ... }:
{
  ".ctags".source = ./ctags/ctags;
  ".editrc".source = ./.editrc;
  ".gitmessage.sample".source = ./git/gitmessage.sample;
  ".inputrc".source = ./.inputrc;
  ".psqlrc".source = ./psql/psqlrc;
  ".pylintrc".source = ./python/pylintrc;
  ".slate".source = ./slate/slate;

  # xinput
  ".xinitrc".source = ./xinput/xinitrc;
  ".xinputrc".source = ./xinput/xinputrc;

  # Ruby dotfiles
  ".irbrc".source = ./ruby/irbrc;
  ".pryrc".source = ./ruby/pryrc;
  ".rspec".source = ./ruby/rspec;
  ".eslintrc.yml".source = ./js/eslintrc.yml;

  # asdf dotfiles
  ".asdfrc".source = ./asdf/asdfrc;
  ".default-gems".source = ./asdf/default-gems;
  ".default-npm-packages".source = ./asdf/default-npm-packages;
  ".tool-versions".source = ./asdf/tool-versions;

  # haskell dotfiles
  ".ghci".source = ./haskell/ghci;
  ".haskeline".source = ./haskell/haskeline;
  ".hindent.yaml".source = ./haskell/hindent.yaml;
  ".stylish-haskell.yaml".source = ./haskell/stylish-haskell.yaml;
  ".summoner.toml".source = ./haskell/summoner.toml;
  "floskell.json".source = ./haskell/floskell.json;

  "dircolors.nord".source = pkgs.fetchFromGitHub
    {
      owner = "arcticicestudio";
      repo = "nord-dircolors";
      rev = "master";
      sha256 = "1c9fa6dip266z6hfqd5nan5v6qjp6dg074lvk4rxisirm26djlzz";
    } + "/src/dir_colors";
}
