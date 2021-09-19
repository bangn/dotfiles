{ inputs, config, pkgs, lib, ... }:
let
  username = "bangn";
  homeDirectory = "/Users/${username}";
in
{
  users.users.bangn.name = "${username}";
  users.users.bangn.home = homeDirectory;
  home-manager.users.bangn = (import ./home.nix);

  environment = {
    loginShell = pkgs.zsh;
    pathsToLink = [ "/Applications" ];
    systemPackages = [ ];
  };

  programs.zsh.enable = true;
  nix.package = pkgs.nix;

  imports = [
    (import ./darwin/preferences.nix { inherit config pkgs homeDirectory; })
    ./darwin/brew.nix
    ./darwin/display-manager.nix
    ./darwin/networking.nix
    <home-manager/nix-darwin>
  ];

  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
