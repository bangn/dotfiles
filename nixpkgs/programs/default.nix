{ pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  home-manager.enable = true;

  direnv = import ./direnv { inherit pkgs; };
  git = import ./git { inherit pkgs; };
  tmux = import ./tmux { inherit pkgs; };
  zsh = import ./zsh { inherit pkgs; };
  lazygit = import ./lazygit { inherit pkgs; };
}
