{ inputs, config, pkgs, lib, ... }:
let
  username = "bang.nguyen";
  homeDirectory = "/Users/${username}";
in
{
  users.users."bang.nguyen".name = "${username}";
  users.users."bang.nguyen".home = homeDirectory;
  home-manager.users."bang.nguyen" = (import ./home.nix);

  environment = {
    loginShell = pkgs.zsh;
    pathsToLink = [ "/Applications" ];
    systemPackages = [ ];
  };

  services.nix-daemon.enable = true;
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
