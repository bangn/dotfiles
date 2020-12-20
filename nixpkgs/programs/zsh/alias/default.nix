with builtins;
let
  bundlerAliases = import ./bundler.nix;
  dockerAliases = import ./docker.nix;
  gitAliases = import ./git.nix;
  neuronAliases = import ./neuron.nix;
  isLinux = ! (isNull (match ".*linux.*" currentSystem));
in
{
  # TODO: Dynamically get dotDir
  ssp = "source ~/.config/zsh/.zshrc";

  cat = "bat";
  fix-stty = "stty sane";
  mmv = "noglob zmv -W";
  mux = "tmuxinator";
  n = "nnn -Hax";
  pbcopy = if isLinux then "xclip -selection clipboard" else "pbcopy";
  pbpaste = if isLinux then "xclip -selection clipboard -o" else "pbpaste";
  tf = "terraform";
  vim = "nvim";

  l =
    let
      option = "--color=auto -Glah";
      command = if isLinux then "ls" else "/usr/local/bin/gls";
    in
    "${command} ${option}";

  grep = builtins.concatStringsSep " " [
    "grep"
    "--color=auto --exclude-dir=\"*snapshots*\""
    "--exclude-dir=\"dist*\""
    "--exclude-dir=.git"
    "--exclude-dir=.stack"
    "--exclude-dir=.stack-work"
    "--exclude-dir=_build"
    "--exclude-dir=coverage"
    "--exclude-dir=deps"
    "--exclude-dir=.next"
    "--exclude-dir=node_modules"
    "--exclude-dir=tmp"
    "--exclude=tags"
  ];
} // dockerAliases // bundlerAliases // gitAliases // neuronAliases
