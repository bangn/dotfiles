{
  pkgs,
  gitDetails,
  ...
}: let
  username = gitDetails.username;
in {
  enable = true;
  package = pkgs.gitAndTools.gitFull;

  userName = username;
  userEmail = gitDetails.email;

  aliases = {
    dds = "diff --stat";
    depgraph = "!git madge image --basedir . --style solarized-dark src > depgraph.png";
    edit = "!f() { git diff --name-status --diff-filter=U | cut -f2 ; }; $EDITOR `f`";
    ls = "log --graph --pretty=format:'%C(yellow)%h%Creset%C(cyan)%d%Creset %s %Cgreen(%cr)%Creset %C(white)<%an>%Creset'";
    lsa = "log --graph --pretty=format:'%C(yellow)%h%Creset%C(cyan)%d%Creset %s %Cgreen(%cr)%Creset %C(white)<%an>%Creset' --all";
    root = "!pwd";
    squash-all = "!f(){ git reset $(git commit-tree HEAD^{tree} -m \${1:-Initial commit});};f";
    tree = "log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";
  };

  extraConfig = {
    advice = {skippedCherryPicks = false;};
    branch = {
      autosetupmerge = true;
      autosetuprebase = "remote";
      sort = "-committerdate";
    };

    credential = {helper = "store";};

    commit = {template = "~/.gitmessage";};

    core = {
      commentChar = ",";
      editor = "nvim -f";
      pager = "delta";
      untrackedCache = true;
    };

    delta = {
      features = "line-numbers decorations";
      navigate = true;
      side-by-side = true;
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

    init = {defaultBranch = "main";};
    interactive = {diffFilter = "delta --color-only";};

    diff = {
      algorithm = "histogram";

      # use difftastic
      # external = "difft --color=always";
      # tool = "difftastic";
    };

    # use difftastic
    # pager = { difftool = true; };
    # difftool = {
    #   difftastic = {
    #     cmd = ''
    #       difft "$MERGED" "$LOCAL" "abcdef1" "100644" "$REMOTE" "abcdef2" "100644"
    #     '';
    #   };
    #
    #   prompt = false;
    # };

    merge = {
      defaultToUpstream = true;
      conflictstyle = "zdiff3";
      tool = "kdiff3";
    };

    pull = {rebase = true;};

    push = {default = "current";};

    rerere = {enable = true;};

    status = {showUntrackedFiles = "all";};

    transfer = {fsckobjects = true;};
    fetch = {
      fsckobjects = true;
      prune = true;
    };
    receive = {fsckobjects = true;};

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
    "Session.vim*"

    # Ignore directories
    "nvim/bakup"
    "nvim/swap"
    "nvim/undo"
    "nvim/autoload/"
    ".netrwhist"
    "bundle"
    "node_modules"
    "tmp"

    # python
    ".venv"
    "__pycache__"

    # Haskell/stack compiler output
    ".stack-work"
    ".stack"

    # bakup directory
    "bakup"

    # terraform
    ".terraform"

    # macOS
    ".DS_Store"

    # rspec tracer cache files
    "*/rspec_tracer_cache/"
    "*/rspec_tracer_coverage/"
    "*/rspec_tracer_report/"

    # text editor / IDE
    "*.iml"
    "*.swp"
    "*.swo"
    ".idea"
    ".rbx"

    # mise config
    ".mise.toml"
  ];
}
