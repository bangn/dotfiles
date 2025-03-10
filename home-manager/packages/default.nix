{
  pkgs,
  pkgsUnstable,
  ...
}:
with builtins; let
  commonPackages = import ./commonPackages.nix {inherit pkgs pkgsUnstable;};
  macosPackages = import ./macosPackages.nix {inherit pkgs pkgsUnstable;};
  linuxPackages = import ./linuxPackages.nix {inherit pkgs pkgsUnstable;};
in
  commonPackages
  ++ (
    if pkgs.stdenv.isLinux
    then linuxPackages
    else macosPackages
  )
