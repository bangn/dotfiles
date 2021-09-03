{ config, pkgs, lib, ... }:
{
  imports = [ <home-manager/nix-darwin> ];
  home-manager = import ./home.nix { pkgs = pkgs; config = config; };
}
