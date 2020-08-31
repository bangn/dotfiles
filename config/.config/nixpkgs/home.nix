{ ... }:
let
  pkgsUnstable = import <nixpkgs> { };
in
with pkgsUnstable;

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

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

  programs.firefox = { enable = true; };
  programs.git = import ./programs/git { pkgs = pkgsUnstable; };
  programs.tmux = import ./programs/tmux { pkgs = pkgsUnstable; };
}
