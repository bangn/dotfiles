{ pkgs, ... }:
let
  username = "bangn";
in
{
  enable = true;
  package = pkgs.gitAndTools.gitFull;

  userName = username;
  userEmail = "thebangnguyen@gmail.com";

  aliases = {
    dds = "diff --stat";
    depgraph = "!git madge image --basedir . --style solarized-dark src > depgraph.png";
    edit = "!f() { git diff --name-status --diff-filter=U | cut -f2 ; }; $EDITOR `f`";
    ls = "log --graph --pretty=format:'%C(yellow)%h%Creset%C(cyan)%d%Creset %s %Cgreen(%cr)%Creset %C(white)<%an>%Creset'";
    lsa = "log --graph --pretty=format:'%C(yellow)%h%Creset%C(cyan)%d%Creset %s %Cgreen(%cr)%Creset %C(white)<%an>%Creset' --all";
    root = "!pwd";
    squash-all = "!f(){ git reset $(git commit-tree HEAD^{tree} -m $\{1:-Initial commit\});};f";
    tree = "log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";
  };

  extraConfig = {
    branch = {
      autosetupmerge = true;
      autosetuprebase = "remote";
    };

    credential = {
      helper = "store";
    };

    commit = {
      template = "~/.gitmessage";
    };

    core = {
      editor = "nvim -f";
      commentChar = ",";
      pager = "diff-so-fancy | less --tabs=4 -RFX";
    };

    diff = {
      algorithm = "patience";
    };

    merge = {
      ff = "only";
      defaultToUpstream = true;
      tool = "kdiff3";
    };

    pull = {
      rebase = true;
    };

    push = {
      default = "current";
    };

    rerere = {
      enable = true;
    };

    status = {
      showUntrackedFiles = "all";
    };

    url = {
      "https://github.com" = {
        insteadOf = "git://github.com";
      };
    };

    user = {
      login = username;
    };
  };

  ignores = [
    # Ignored files
    "*.beam"
    "*.tags"
    "*.vimfuzzyfinder"
    ".env"
    ".envrc"
    ".smithrc"
    ".talismanrc"
    ".uuid"
    "npm-debug.log"
    "tags"
    "tags.*"

    # Ignore directories
    "nvim/bakup"
    "nvim/swap"
    "nvim/undo"
    "nvim/autoload/"
    ".netrwhist"
    "bundle"
    "node_modules"
    "tmp"

    # Ignore asdf local package version
    ".tool-versions"

    # Haskell/stack compiler output
    ".stack-work"
    ".stack"

    # bakup directory
    "bakup"

    # neuron dir
    ".neuron"
  ];
}
