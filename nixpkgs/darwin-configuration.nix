{ inputs, config, pkgs, lib, ... }:
let
  userDetails = import ./userDetails.nix;
  username = userDetails.username;
  homeDirectory = "/Users/${username}";
in {
  users.users."${username}" = {
    name = "${username}";
    home = homeDirectory;
  };
  home-manager.users."${username}" = (import ../home-manager/home.nix);

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

  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;

  imports = [
    (import ./darwin/preferences.nix { inherit config pkgs homeDirectory; })
    ./darwin/brew.nix
    (import ./darwin/networking.nix { inherit userDetails; })
    <home-manager/nix-darwin>
  ];

  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
