{ pkgs, ... }:
with builtins;
let
  isLinux = ! (isNull (match ".*linux.*" currentSystem));
  commonPackages = import ./commonPackages.nix { inherit pkgs; };
  linuxPackages = import ./linuxPackages.nix { inherit pkgs; };
in
if isLinux then (commonPackages ++ linuxPackages) else commonPackages
