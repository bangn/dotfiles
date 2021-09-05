{ inputs, config, pkgs, lib, ... }:
{
  environment = {
    loginShell = pkgs.zsh;
    pathsToLink = [ "/Applications" ];
    systemPackages = [ ];
  };

  programs.zsh.enable = true;

  nix.package = pkgs.nix;

  imports = [
    ./darwin/brew.nix
    ./darwin/display-manager.nix
    ./darwin/networking.nix
    ./darwin/preferences.nix
    <home-manager/nix-darwin>
  ];

  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
