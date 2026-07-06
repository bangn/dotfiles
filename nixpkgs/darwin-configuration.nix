{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: let
  userDetails = import ./userDetails.nix;
  username = userDetails.username;
  homeDirectory = "/Users/${username}";
in {
  users.users."${username}" = {
    name = "${username}";
    home = homeDirectory;
  };
  home-manager.users."${username}" = import ../home-manager/home.nix;

  environment = {
    pathsToLink = ["/Applications"];
    systemPackages = [];
  };

  nix.gc = {
    automatic = true;
    interval = {
      Hour = 10;
      Minute = 0;
    }; # every day
    options = "--delete-older-than 1d";
  };

  nix.settings.auto-optimise-store = true;

  # HTML manual build is broken by nixpkgs-unstable's nixos-render-docs
  # dropping --toc-depth; re-enable once nix-darwin#1819 is merged.
  # The uninstaller evaluates its own system with docs enabled, so it
  # must be disabled as well.
  documentation.doc.enable = false;
  system.tools.darwin-uninstaller.enable = false;

  nix.enable = true;
  nix.package = pkgs.nix;
  programs.zsh = {
    enable = true;
    promptInit = "autoload -U promptinit && promptinit";
  };

  # Add ability to used TouchID for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;

  imports = [
    (import ./darwin/preferences.nix {inherit config pkgs homeDirectory;})
    ./darwin/brew.nix
    (import ./darwin/networking.nix {inherit userDetails;})
    <home-manager/nix-darwin>
  ];

  # $ darwin-rebuild changelog
  system.stateVersion = 4;
  system.primaryUser = username;
}
