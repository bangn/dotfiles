{
  git = "hub";

  ga = "git add --all";
  gap = "git add --all -p";
  gau = "git add -u";

  gb = "git branch";
  gba = ''git branch -a --format "%(committerdate:short)%09%(refname:short)"'';
  gbc = "git clean-branches -f";
  gbd = "git branch -d";

  gca = "git commit --amend";
  gcm = "git commit -m";

  gco = "git checkout";
  gcoh = "git checkout HEAD --";

  gd = "git diff";
  gdc = "git diff --cached";
  gdcn = "git diff --cached --name-only";
  gdcw = "git diff --cached --word-diff";
  gdmb = "git diff $(git show-branch --merge-base)..HEAD";
  gdmbn = "git diff $(git show-branch --merge-base)..HEAD --name-only";
  gdn = "git diff --name-only";
  gdw = "git diff --word-diff";

  gisc = "gh issue create";
  gisls = "gh issue list";
  gisv = "gh issue view";

  gl = "git log --ext-diff";
  glog = "git log --branches --remotes --graph --oneline --decorate";
  gls = "git ls";
  glsa = "git lsa";

  gprco = "gh pr checkout";
  gprls = "gh pr list";
  gprc = "gh pr create --web";
  gprv = "gh pr view --web";

  gprb = "git pull --rebase";
  gf = "git fetch -p";
  gpl = "git fetch -p && git rebase --rebase-merges";

  gps = "git push";
  gpsf = "git push --force-with-lease";
  gpsu = ''git push -u origin "$(git rev-parse --abbrev-ref HEAD)" "$@"'';

  gra = "git rebase --abort";
  grb = "git rebase";
  grc = "git rebase --continue";
  gri = "git rebase -i";

  gsh = "git show --ext-diff";
  gshn = "git show HEAD --name-only";

  gstl = "git stash list";
  gsts = "git stash save -u";

  gcb = "git checkout -b";
  gcp = "git cherry-pick";
  gs = "git status -sb";
}
