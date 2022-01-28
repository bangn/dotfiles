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
      pager = "delta";
    };

    delta = {
      features = "line-numbers decorations";
      syntax-theme = "Nord";

      decorations = {
        commit-decoration-style = "bold yellow box ul";
        file-style = "bold yellow ul";
        file-decoration-style = "none";
        hunk-header-decoration-style = "cyan box ul";
      };

      line-numbers = {
        line-numbers-left-style = "cyan";
        line-numbers-right-style = "cyan";
        line-numbers-minus-style = 124;
        line-numbers-plus-style = 28;
      };
    };

    init = {
      defaultBranch = "main";
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
      signingkey = "F06A6429E41ACFBC";
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
    "Session.vim"

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

    # terraform
    ".terraform"

    # macOS
    ".DS_Store"

    # rspec tracer cache files
    "*/rspec_tracer_cache/"
    "*/rspec_tracer_coverage/"
    "*/rspec_tracer_report/"
  ];
}
