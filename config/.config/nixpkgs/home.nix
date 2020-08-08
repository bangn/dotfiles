{ pkgs, config, ... }:

let
  pkgsUnstable = import <nixpkgs> {};
in

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";
  home.username = "bangn";
  home.homeDirectory = "/home/bangn";

  home.packages = [
    pkgs.glibcLocales
    pkgsUnstable.neuron-notes
    pkgsUnstable.alacritty
    pkgsUnstable.autojump
    pkgsUnstable.aws-sam-cli
    pkgsUnstable.awscli
    pkgsUnstable.awslogs
    pkgsUnstable.bat
    pkgsUnstable.ctags
    pkgsUnstable.curlFull
    pkgsUnstable.direnv
    pkgsUnstable.docker-compose
    pkgsUnstable.entr
    pkgsUnstable.fd
    pkgsUnstable.ghcid
    pkgsUnstable.gitAndTools.delta
    pkgsUnstable.gitAndTools.diff-so-fancy
    pkgsUnstable.gitAndTools.gitFull
    pkgsUnstable.gitAndTools.hub
    pkgsUnstable.graphviz
    pkgsUnstable.hlint
    pkgsUnstable.htop
    pkgsUnstable.jq
    pkgsUnstable.kdiff3
    pkgsUnstable.ncdu
    pkgsUnstable.neovim
    pkgsUnstable.niv
    pkgsUnstable.nixops
    pkgsUnstable.pandoc
    pkgsUnstable.pdftk
    pkgsUnstable.pinta
    pkgsUnstable.plantuml
    pkgsUnstable.postgresql_12
    pkgsUnstable.python38Packages.yamllint
    pkgsUnstable.ripgrep
    pkgsUnstable.rofi
    pkgsUnstable.saml2aws
    pkgsUnstable.shellcheck
    pkgsUnstable.shfmt
    pkgsUnstable.stow
    pkgsUnstable.stylish-haskell
    pkgsUnstable.tmux
    pkgsUnstable.travis
    pkgsUnstable.tree
    pkgsUnstable.yq
  ];
}
