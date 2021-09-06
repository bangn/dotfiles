{ pkgs, config, ... }:
with builtins;
let
  isLinux = ! (isNull (match ".*linux.*" currentSystem));
  pkgsUnstable = import <nixpkgs> { };
  username = "bangn";
  homeDir = if isLinux then "/home/${username}" else "/Users/${username}";
in
with pkgsUnstable;
{
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";
  home.username = username;
  home.homeDirectory = homeDir;
  home.packages = import ./packages { pkgs = pkgsUnstable; };
  home.sessionPath = [
    "${config.home.homeDirectory}/.cabal/bin"
    "${config.home.homeDirectory}/.cargo/bin"
    "${config.home.homeDirectory}/.ghcup/bin"
    "${config.home.homeDirectory}/.local/bin"
    "${config.home.homeDirectory}/.talisman/bin"
    "${config.home.homeDirectory}/dotfiles/tools/bin"
    "/opt/ghc/bin"
    "/usr/local/bin"
  ];
  home.file =
    let
      configFiles = import ./config { inherit pkgs; };
      desktop = import ./desktop { inherit pkgs; };
      homedot = import ./homedot { inherit pkgs; };
    in
    homedot // configFiles // desktop;

  programs = import ./programs { pkgs = pkgsUnstable; };
  news.display = "silent";

  xdg = {
    configFile = {
      nvim = {
        source = "${config.home.homeDirectory}/.config/nvim";
        recursive = true;
      };
    };
  };

  services =
    if isLinux then {
      keybase = { enable = true; };
      flameshot = { enable = true; };
    } else { };

  xresources.extraConfig = builtins.readFile
    (
      pkgs.fetchFromGitHub
        {
          owner = "arcticicestudio";
          repo = "nord-xresources";
          rev = "36fadf13c00ac08913ee8f297f038fa2733fd5ed";
          sha256 = "1bhlhlk5axiqpm6l2qaij0cz4a53i9hcfsvc3hw9ayn75034xr93";
        } + "/src/nord"
    );
}
