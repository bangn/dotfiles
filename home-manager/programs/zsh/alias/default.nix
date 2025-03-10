{pkgs, ...}: let
  bundlerAliases = import ./bundler.nix;
  dockerAliases = import ./docker.nix;
  gitAliases = import ./git.nix;
  k8sAliases = import ./k8s.nix;
in
  {
    # TODO: Dynamically get dotDir
    ssp = "source ~/.config/zsh/.zshrc";

    cat = "bat";
    fix-stty = "stty sane";
    lg = "lazygit";
    mmv = "noglob zmv -W";
    mux = "tmuxinator";
    ola = "ollama";
    pbcopy =
      if pkgs.stdenv.isLinux
      then "xclip -selection clipboard"
      else "pbcopy";
    pbpaste =
      if pkgs.stdenv.isLinux
      then "xclip -selection clipboard -o"
      else "pbpaste";
    tf = "terraform";
    vim = "nvim";

    l = let
      option = "--color=auto -Glah";
      command = "ls";
    in "${command} ${option}";

    grep = builtins.concatStringsSep " " [
      "grep"
      ''--color=auto --exclude-dir="*snapshots*"''

      "--exclude-dir=.git"
      "--exclude-dir=.gradle"
      "--exclude-dir=.idea"
      "--exclude-dir=.jj"
      "--exclude-dir=.next"
      "--exclude-dir=.stack"
      "--exclude-dir=.stack-work"
      "--exclude-dir=.venv"
      "--exclude-dir=_build"
      "--exclude-dir=build"
      "--exclude-dir=coverage"
      "--exclude-dir=deps"
      "--exclude-dir=log"
      "--exclude-dir=node_modules"
      "--exclude-dir=out"
      "--exclude-dir=postgres"
      "--exclude-dir=rspec_tracer_cache"
      "--exclude-dir=rspec_tracer_coverage"
      "--exclude-dir=rspec_tracer_report"
      "--exclude-dir=tmp"
      "--exclude=tags"
      ''--exclude-dir="dist*"''
    ];
  }
  // dockerAliases
  // bundlerAliases
  // gitAliases
  // k8sAliases
