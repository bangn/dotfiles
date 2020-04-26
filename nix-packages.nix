# To install run
# nix-env -f nix-packages.nix -i --remove-all

let
  nixpkgs = import <nixpkgs> { };

  packages =
    [
      # Sourced directly from nixpkgs
      nixpkgs.alacritty
      nixpkgs.autojump
      nixpkgs.awscli
      nixpkgs.awslogs
      nixpkgs.bat
      nixpkgs.ctags
      nixpkgs.curlFull
      nixpkgs.direnv
      nixpkgs.docker-compose
      nixpkgs.entr
      nixpkgs.fd
      nixpkgs.ghcid
      nixpkgs.gitAndTools.delta
      nixpkgs.gitAndTools.diff-so-fancy
      nixpkgs.gitAndTools.gitFull
      nixpkgs.gitAndTools.hub
      nixpkgs.graphviz
      nixpkgs.hlint
      nixpkgs.htop
      nixpkgs.jq
      nixpkgs.neovim
      nixpkgs.niv
      nixpkgs.nix
      nixpkgs.nixops
      nixpkgs.postgresql_12
      nixpkgs.shfmt
      nixpkgs.stow
      nixpkgs.stylish-haskell
      nixpkgs.tmux
      nixpkgs.travis
      nixpkgs.yq
    ];

in packages
