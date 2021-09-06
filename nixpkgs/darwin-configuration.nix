{ inputs, config, pkgs, lib, ... }:
let
  username = "bangn";
in
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

  users.users.bangn.name = "${username}";
  users.users.bangn.home = "/Users/${username}";
  home-manager.users.bangn = (import ./home.nix);

  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
