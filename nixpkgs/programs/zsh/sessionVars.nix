{ pkgs, ... }:
let
  drivers = [ pkgs.mesa.drivers ];
  fdOptions = builtins.concatStringsSep " " [
    "--ignore-case"
    "--hidden"
    "--exclude .git"
    "--exclude deps"
    "--exclude _build"
    "--exclude node_modules"
  ];

  fzfDefaultCommand =
    builtins.concatStringsSep " " [ "fd" "--type f" fdOptions ];

  fzfDefaultCommandOpts = builtins.concatStringsSep " " [
    "--preview"
    "'bat --style=numbers --color=always --line-range :500 {}'"
  ];

in {
  # home-manager
  NIX_PATH = "$HOME/.nix-defexpr/channels\${NIX_PATH:+:}$NIX_PATH";

  ########################################
  # Show hidden files on top
  ########################################
  LC_COLLATE = "C";

  ########################################
  # Editor
  ########################################
  EDITOR = "nvim";
  MANPAGER = "nvim +Man!";
  SUDO_ASKPASS = "/usr/bin/ssh-askpass";
  VISUAL = "nvim";

  ########################################
  # Postgres
  ########################################
  PGUSER = "postgres";
  PGHOST = "localhost";
  PGPASSWORD = "password";

  ########################################
  # Change output of `time` command format
  # make it same as bash output.
  ########################################
  TIMEFMT = ''

    real	%E
    user	%U
    sys	%S'';

  ########################################
  # Change output of `time` command format
  # make it same as bash output.
  ########################################
  NNN_BMS = "d:~/dev;D:~/Downloads/";
  NNN_PLUG = "f:fzcd;o:fzopen;p:preview-tui";
  NNN_TRASH = 1;

  ########################################
  # Use docker buildkit as default to improve build performance
  ########################################
  DOCKER_BUILDKIT = 1;

  ########################################
  # Misc
  ########################################
  KEYTIMEOUT = 1;
  LSCOLORS = "Gxfxcxdxbxegedabagacad";

  ########################################
  # fzf
  ########################################
  FZF_DEFAULT_COMMAND = fzfDefaultCommand;
  FZF_DEFAULT_COMMAND_OPTS = fzfDefaultCommandOpts;
  FZF_CTRL_T_COMMAND = fzfDefaultCommand;
  FZF_CTRL_T_OPTS = fzfDefaultCommandOpts;
  FZF_ALT_C_COMMAND =
    builtins.concatStringsSep " " [ "fd" "--type d" fdOptions ];
  FZF_ALT_C_OPTS = "";

  ########################################
  # Fix glx issue in nix-shell
  ########################################
  LIBGL_DRIVERS_PATH = pkgs.lib.makeSearchPathOutput "lib" "lib/dri" drivers;
  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath drivers;

  ########################################
  # Fix locale
  # https://qiita.com/kimagure/items/4449ceb0bda5c10ca50f
  ########################################
  LOCALE_ARCHIVE_2_27 =
    pkgs.lib.makeSearchPathOutput "lib" "lib/locale/locale-archive"
    [ pkgs.glibcLocales ];
  LOCALE_ARCHIVE =
    pkgs.lib.makeSearchPathOutput "lib" "lib/locale/locale-archive"
    [ pkgs.glibcLocales ];

  ########################################
  # Running keybase-ui without checking kbfsfuse
  ########################################
  NIX_SKIP_KEYBASE_CHECKS = 1;
}
