{
  ga = "git add --all";
  gap = "git add --all -p";
  gau = "git add -u";

  gb = "git branch";
  gba = "git branch -a";
  gbd = "git branch -d";

  gca = "git commit --amend";
  gcm = "git commit -m";

  gco = "git checkout";
  gcoh = "git checkout HEAD --";
  gcom = "git checkout master";

  gd = "git diff";
  gdc = "git diff --cached";
  gdcn = "git diff --cached  --name-only";
  gdcw = "git diff --cached --word-diff";
  gdm = "git diff master";
  gdmb = "git diff $(git show-branch --merge-base)..HEAD";
  gdmbn = "git diff $(git show-branch --merge-base)..HEAD --name-only";
  gdmn = "git diff master --name-only";
  gdn = "git diff --name-only";
  gdom = "git diff origin/master";
  gdw = "git diff --word-diff";

  gic = "git issue create";
  gils = "git issue";
  gis = "git issue show";

  gl = "git log";
  glog = "git log --branches --remotes --graph --oneline --decorate";
  gls = "git ls";
  glsa = "git lsa";

  gprco = "git pr checkout";
  gprls = "git pr list -f \"%pC%U%Creset  %t (%au)%n\"";
  gprlsa = "git pr list -f \"%sH %pC%U%Creset  %t (%au)%n\"";

  gprc = "git pull-request";
  gprom = "git pull --rebase origin master";

  gf = "git fetch -p";
  gpl = "git fetch -p && git rebase --rebase-merges";

  gps = "git push";
  gpsf = "git push --force-with-lease";
  gpsu = "git push -u origin \"\$(git rev-parse --abbrev-ref)\" \"\$@\"";

  gra = "git rebase --abort";
  grc = "git rebase --continue";
  gri = "git rebase -i";
  grim = "git rebase -i master";

  gsh = "git show HEAD";
  gshn = "git show HEAD --name-only";

  gsta = "git stash apply stash@{\"\${1:-0}\"}";
  gstd = "git stash drop stash@{\"\${1:-0}\"}";
  gstl = "git stash list";
  gstp = "git stash pop stash@{\"\${1:-0}\"}";
  gsts = "git stash save -u";
  gstsh = "git stash show -p stash@{\"\${1:-0}\"}";

  gbr = "git browse";
  gbri = "git browse -- issues/\"\$1\"";

  gcb = "git checkout -b";
  gcis = "git ci-status";
  gcp = "git cherry-pick";
  ge = "git edit"; # edit function in ~/.gitconfig;
  gr = "git reset";
  gs = "git status -sb";
}
