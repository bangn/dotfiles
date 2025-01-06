{pkgs, ...}: {
  enable = true;
  shortcut = "a";

  baseIndex = 1;
  clock24 = true;
  escapeTime = 0;
  historyLimit = 10000;
  keyMode = "vi";
  sensibleOnTop = false;
  terminal = "screen-256color";

  tmuxinator = {enable = true;};

  extraConfig = import ./extraConfig.nix;
}
