{
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
}
