{ inputs, config, pkgs, lib, ... }:
let
  username = "bangn";
  homeDirectory = "/Users/${username}";
in {
  users.users."${username}" = {
    name = "${username}";
    home = homeDirectory;
  };
  home-manager.users."${username}" = (import ./home.nix);

  environment = {
    loginShell = pkgs.zsh;
    pathsToLink = [ "/Applications" ];
    systemPackages = [ ];
  };

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
  programs.zsh = {
    enable = true;
    promptInit = "autoload -U promptinit && promptinit";
  };

  imports = [
    (import ./darwin/preferences.nix { inherit config pkgs homeDirectory; })
    ./darwin/brew.nix
    ./darwin/networking.nix
    <home-manager/nix-darwin>
  ];

  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
