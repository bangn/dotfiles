{pkgs, ...}:
with builtins; let
  commonPackages = import ./commonPackages.nix {inherit pkgs;};
  macosPackages = import ./macosPackages.nix {inherit pkgs;};
  linuxPackages = import ./linuxPackages.nix {inherit pkgs;};
in
  commonPackages
  ++ (
    if pkgs.stdenv.isLinux
    then linuxPackages
    else macosPackages
  )
