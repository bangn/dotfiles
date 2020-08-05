#! /bin/bash

alias g='git'
alias ga='git add --all'
alias gap='git add --all -p'
alias gau='git add -u'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbf='git branch --format "%(refname:short) %(upstream:track)"'
alias gbr='git browse'
alias gca='git commit --amend'
alias gcb='git checkout -b'
alias gcis='git ci-status'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcoh='git checkout HEAD --'
alias gcom='git checkout master'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdcn='git diff --cached  --name-only'
alias gdcw='git diff --cached --word-diff'
alias gdds='git dds'
alias gdm='git diff master'
alias gdmb='git diff $(git show-branch --merge-base)..HEAD'
alias gdmbn='git diff $(git show-branch --merge-base)..HEAD --name-only'
alias gdmn='git diff master --name-only'
alias gdn='git diff --name-only'
alias gdom='git diff origin/master'
alias gds='git ds'
alias gdw='git diff --word-diff'
alias ge='git edit' # edit function in ~/.gitconfig
alias gf='git fetch -p'
alias gic='git issue create'
alias gils='git issue'
alias gis='git issue show'
alias gl='git log'
alias glog='git log --branches --remotes --graph --oneline --decorate'
alias gls='git ls'
alias glsa='git lsa'
alias gm='git merge'
alias gpl='git fetch -p && git rebase --rebase-merges'
alias gprc='git pull-request'
alias gprco='git pr checkout'
alias gprls='git pr list -f "%pC%U%Creset  %t (%au)%n"'
alias gprlsa='git pr list -f "%sH %pC%U%Creset  %t (%au)%n"'
alias gprom='git pull --rebase origin master'
alias gps='git push'
alias gr='git reset'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gri='git rebase -i'
alias grim='git rebase -i master'
alias gs='git status -sb'
alias gsh='git show HEAD'
alias gshn='git show HEAD --name-only'
alias gstl='git stash list'
alias gsts='git stash save -u'
alias gx='gitx'
alias gpsf='git push --force-with-lease'

# Alias git to hub
eval "$(hub alias -s)"

gsta() {
  # shellcheck disable=SC1083
  git stash apply stash@{"${1:-0}"}
}

gstp() {
  # shellcheck disable=SC1083
  git stash pop stash@{"${1:-0}"}
}

gstsh() {
  # shellcheck disable=SC1083
  git stash show -p stash@{"${1:-0}"}
}

gstd() {
  # shellcheck disable=SC1083
  git stash drop stash@{"${1:-0}"}
}

gitme() {
  git init
  touch README.md
  git add --all
  git commit -m 'Initial commit'
}

# Purge branch or all branches except master
gbp() {
  if [[ -z "$1" ]]; then
    git branch | grep -v master | xargs -I {} git branch -D {}
  else
    git branch -D "$1"
  fi
}

# Update commit message template. This will overwrite ~/.gitmessage.
# Support JIRA workflow and kowainik workflow
update_git_message_template() {
  local CURRENT_BRANCH
  local GIT_USER
  local JIRA_WORKFLOW_PATTERN
  local KOWAINIK_WORKFLOW_PATTERN
  local PREFIX_MESSAGE

  CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"

  # shellcheck disable=SC2001
  PREFIX_MESSAGE=$(echo "$CURRENT_BRANCH" | sed 's/\([A-Z]*[\-|\/][0-9]*\).*/\1/')
  JIRA_WORKFLOW_PATTERN="[A-Z]+-[0-9]+"

  GIT_USER=$(git config user.login)
  KOWAINIK_WORKFLOW_PATTERN="$GIT_USER/[0-9]+"

  # Current branch name does not match Jira format. Use sample git message.
  if [[ $PREFIX_MESSAGE =~ $JIRA_WORKFLOW_PATTERN ]]; then
    echo "$PREFIX_MESSAGE" | awk -F'-' '{ print toupper($1)"-"$2": " }' >"$HOME/.gitmessage"
  elif [[ $PREFIX_MESSAGE =~ $KOWAINIK_WORKFLOW_PATTERN ]]; then
    echo "$PREFIX_MESSAGE" | awk -F'/' '{ print "[#"$2"]: " }' >"$HOME/.gitmessage"
  elif [[ $CURRENT_BRANCH == master ]]; then
    cp "$HOME/.gitmessage.sample" "$HOME/.gitmessage"
  else
    echo "$CURRENT_BRANCH:" >"$HOME/.gitmessage"
  fi
}

gc() {
  update_git_message_template && git commit "$@"
}

gcf() {
  COMMIT_HASH="$1"
  shift
  git commit "$@" --fixup "$COMMIT_HASH"
  git rebase --interactive --autosquash "$COMMIT_HASH"^
}

gbrpr() {
  local pr
  if [[ -z "$1" ]]; then
    pr="pulls"
  else
    pr="pull/$1"
  fi

  git browse -- "$pr"
}

gbri() {
  git browse -- issues/"$1"
}

gpsu() {
  git push -u origin "$(git rev-parse --abbrev-ref)" "$@"
}
