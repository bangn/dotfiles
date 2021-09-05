{ pkgs, ... }:
with builtins; with pkgs;
let
  isLinux = ! (isNull (match ".*linux.*" currentSystem));
  commonPackages = import ./commonPackages.nix { inherit pkgs; };
  linuxPackage = import ./linuxPackage.nix { inherit pkgs; };
in
if isLinux then commonPackages // linuxPackage else commonPackages
