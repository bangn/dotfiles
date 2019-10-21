# To install run
# nix-env -f nix-packages.nix -i --remove-all

let
  nixpkgs = import <nixpkgs> { };

  packages =
    [
      # Sourced directly from nixpkgs
      nixpkgs.alacritty
      nixpkgs.autojump
      nixpkgs.bat
      nixpkgs.ctags
      nixpkgs.curlFull
      nixpkgs.direnv
      nixpkgs.gitAndTools.gitFull
      nixpkgs.gitAndTools.hub
      nixpkgs.graphviz
      nixpkgs.hlint
      nixpkgs.htop
      nixpkgs.jq
      nixpkgs.neovim
      nixpkgs.nix
      nixpkgs.nixops
      nixpkgs.stow
      nixpkgs.stylish-haskell
      nixpkgs.tmux
      nixpkgs.travis
      nixpkgs.yq
    ];

in packages
