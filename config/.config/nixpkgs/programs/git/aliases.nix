{
  dds = "diff --stat";
  depgraph = "!git madge image --basedir . --style solarized-dark src > depgraph.png";
  edit = "!f() { git diff --name-status --diff-filter=U | cut -f2 ; }; $EDITOR `f`";
  ls = "log --graph --pretty=format:'%C(yellow)%h%Creset%C(cyan)%d%Creset %s %Cgreen(%cr)%Creset %C(white)<%an>%Creset'";
  lsa = "log --graph --pretty=format:'%C(yellow)%h%Creset%C(cyan)%d%Creset %s %Cgreen(%cr)%Creset %C(white)<%an>%Creset' --all";
  root = "!pwd";
  squash-all = "!f(){ git reset $(git commit-tree HEAD^{tree} -m $\{1:-Initial commit\});};f";
  tree = "log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";
}
