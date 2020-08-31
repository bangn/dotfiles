{ ... }:
let
  pkgsUnstable = import <nixpkgs> { };
in
with pkgsUnstable;

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
    alacritty
    autojump
    aws-sam-cli
    awscli
    awslogs
    bat
    ctags
    curlFull
    direnv
    docker-compose
    entr
    faac # required for zoom
    fd
    ghcid
    gitAndTools.delta
    gitAndTools.diff-so-fancy
    gitAndTools.hub
    glibcLocales
    google-chrome-dev
    google-cloud-sdk
    graphviz
    hlint
    htop
    jq
    kdiff3
    lastpass-cli
    mdl
    ncdu
    neovim
    neuron-notes
    niv
    nixops
    nixpkgs-fmt
    nnn
    pandoc
    pdftk
    pinta
    plantuml
    postgresql_12
    python38Packages.sqlparse
    python38Packages.yamllint
    ripgrep
    rofi
    saml2aws
    shellcheck
    shfmt
    slack-dark
    stow
    stylish-haskell
    sxiv
    thunderbird-78
    trash-cli
    tree
    xcompmgr
    yamllint
    yq
    zoom-us
  ];

  programs.firefox = {
    enable = true;
  };

  programs.git = import ./programs/git { pkgs = pkgsUnstable; };
  programs.tmux = import ./programs/tmux { pkgs = pkgsUnstable; };
}
