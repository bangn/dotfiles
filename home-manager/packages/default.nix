{
  pkgs,
  pkgsUnstable,
  ...
}:
with builtins; let
  isLinux = !(isNull (match ".*linux.*" currentSystem));
  commonPackages = import ./commonPackages.nix {inherit pkgs pkgsUnstable;};
  macosPackages = import ./macosPackages.nix {inherit pkgs pkgsUnstable;};
  linuxPackages = import ./linuxPackages.nix {inherit pkgs pkgsUnstable;};
in
  commonPackages
  ++ (
    if isLinux
    then linuxPackages
    else macosPackages
  )
