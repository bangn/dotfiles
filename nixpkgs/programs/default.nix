{ pkgs, homeDir, ... }:

{
  # Let Home Manager install and manage itself.
  home-manager.enable = true;

  direnv = import ./direnv { inherit pkgs; };
  git = import ./git { inherit pkgs; };
  lazygit = import ./lazygit { inherit pkgs; };
  tmux = import ./tmux { inherit pkgs; };

  fzf = {
    enable = true;

    changeDirWidgetCommand = let
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
    in fzfDefaultCommand;

    defaultOptions = [
      "--preview"
      "'bat --style=numbers --color=always --line-range :500 {}'"
    ];
  };

  zoxide = { enable = true; };

  zsh = import ./zsh {
    inherit pkgs;
    homeDir = homeDir;
  };
}
