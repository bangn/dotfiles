{
  pkgs,
  config,
  ...
}:
with builtins; let
  pkgsUnstable = import <nixpkgs> {
    system = pkgs.stdenv.hostPlatform.system;
    overlays = [
      # nixpkgs only skips mise's setuid-bit OCI test on Linux, but the darwin
      # nix sandbox also strips setuid bits, so the test fails the check phase
      # on macOS. Override here so every pkgsUnstable.mise reference (package
      # list and zsh completion) uses the patched build.
      # Drop this overlay once nixpkgs gates the skip on darwin too.
      (final: prev: {
        mise = prev.mise.overrideAttrs (old: {
          checkFlags =
            (old.checkFlags or [])
            ++ prev.lib.optionals prev.stdenv.hostPlatform.isDarwin [
              "--skip=oci::layer::tests::preserve_metadata_dir_layer_keeps_special_permission_bits"
            ];
        });
      })
    ];
  };
  # This one is very couple with bootstrap script
  userDetails =
    if pkgs.stdenv.isLinux
    then import ../nixpkgs/userDetails.nix
    else import ../.nixpkgs/userDetails.nix;
  username = userDetails.username;
  homeDir =
    if pkgs.stdenv.isLinux
    then "/home/${username}"
    else "/Users/${username}";
in
  with pkgsUnstable; {
    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "25.11";
    home.username = username;
    home.homeDirectory = homeDir;
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

    home.packages = import ./packages {
      pkgs = pkgsUnstable;
    };

    home.file = let
      configFiles = import ./config {
        pkgs = pkgsUnstable;
        inherit config;
      };
      desktop = import ./desktop {inherit pkgs;};
      homedot = import ./homedot {inherit pkgs;};
    in
      homedot // configFiles // desktop;

    programs = import ./programs {
      pkgs = pkgsUnstable;
      homeDir = homeDir;
      userDetails = userDetails;
      inherit config;
    };
    news.display = "silent";

    targets.darwin.copyApps.enable = false;

    xdg = {
      configFile = {
        nvim = {
          source = "${config.home.homeDirectory}/dotfiles/nvim";
          recursive = true;
        };
      };
    };

    services =
      if pkgs.stdenv.isLinux
      then {
        keybase = {enable = true;};
        flameshot = {enable = true;};
      }
      else {};

    xresources.extraConfig = builtins.readFile (pkgs.fetchFromGitHub {
        owner = "arcticicestudio";
        repo = "nord-xresources";
        rev = "36fadf13c00ac08913ee8f297f038fa2733fd5ed";
        sha256 = "1bhlhlk5axiqpm6l2qaij0cz4a53i9hcfsvc3hw9ayn75034xr93";
      }
      + "/src/nord");
  }
