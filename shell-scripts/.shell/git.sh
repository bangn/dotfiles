#! /bin/bash

alias g='git'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gs='git status -sb'
alias gpl='git fetch -p && git rebase -p'
alias gprom='git pull --rebase origin master'
alias gps='git push'
alias gpsu='git push -u'
alias ga='git add --all'
alias gau='git add -u'
alias gm='git merge'
alias gco='git checkout'
alias gcom='git checkout master'
alias gcb='git checkout -b'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gf='git fetch -p'
alias gr='git reset'
alias gd='git diff'
alias gds='git ds'
alias gdds='git dds'
alias gdw='git diff --word-diff'
alias gdc='git diff --cached'
alias gdcw='git diff --cached --word-diff'
alias gdm='git diff master'
alias gdn='git diff --name-only'
alias gdcn='git diff --cached  --name-only'
alias gdmn='git diff master --name-only'
alias gdom='git diff origin/master'
alias gl='git log'
alias gls='git ls'
alias glsa='git lsa'
alias gcp='git cherry-pick'
alias gri='git rebase -i'
alias grim='git rebase -i master'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias gsh='git show HEAD'
alias gshn='git show HEAD --name-only'
alias ge='git edit' # edit function in ~/.gitconfig
alias gx='gitx'
alias gcoh='git checkout HEAD --' # reverts changes for whatever file is passed
                                  # usage: $ gcoh lib/example.rb
alias gdmb='git diff $(git show-branch --merge-base)..HEAD'
alias gdmbn='git diff $(git show-branch --merge-base)..HEAD --name-only'
alias gap='git add --all -p'

alias glog='git log --branches --remotes --graph --oneline --decorate'

alias gstl='git stash list'
alias gsts='git stash save -u'
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
  git add --all
  git commit -m 'Initial commit.'
}

alias gblame='git gui blame 2>/dev/null' # tried newer tcl-tk; no dice. /dev/null it is!
                                         # usage: $ gblame lib/example.rb

# Purge branch or all branches except master
gbp() {
  if [[ -z "$1" ]]; then
    git branch | grep -v master | xargs -I {} git branch -D {}
  else
    git branch -D "$1"
  fi
}

# Update commit message template. This will overwrite ~/.gitmessage.
# As I work mostly with Jira ticket therefore the branch name normarlly will
# start with Jira ticket number(Eg: JIRA-123-brief-description). This script
# will get the Jira ticket from the branch and put it into ~/.gitmessage.
# It saves a bit of time to insert Jira ticket everytime I make a commit.
update_git_message_template() {
  CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
  # shellcheck disable=SC2001
  PREFIX_MESSAGE=$(echo "$CURRENT_BRANCH" | sed 's/\([A-Z]*\-[0-9]*\).*/\1/')

  # Current branch name does not match Jira format. Use sample git message.
  if [[ $PREFIX_MESSAGE =~ [A-Z]+-[0-9]+ ]] ; then
    echo "$PREFIX_MESSAGE: " | awk '{ print toupper($0) }' > "$HOME/.gitmessage"
  else
    cp "$HOME/.gitmessage.sample" "$HOME/.gitmessage"
  fi
}
gc() {
  update_git_message_template && git commit
}

gcf() {
  git commit --fixup "$1"
  git rebase --interactive --autosquash "$1"^
}
