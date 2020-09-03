{ pkgs, ... }:
let
  pkgsUnstable = import <nixpkgs> { };
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
  home.username = "bangn";
  home.homeDirectory = "/home/bangn";
  home.packages = import ./packages.nix { pkgs = pkgsUnstable; };
  home.file = import ./dotfiles { inherit pkgs; };

  programs = import ./programs { pkgs = pkgsUnstable; };

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
