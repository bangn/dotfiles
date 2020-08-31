{ pkgs, ... }:

{
  enable = true;
  package = pkgs.gitAndTools.gitFull;

  userName = "bangn";
  userEmail = "thebangnguyen@gmail.com";

  aliases = import ./aliases.nix;
  extraConfig = import ./extraConfig.nix;
  ignores = import ./ignore.nix;
}
