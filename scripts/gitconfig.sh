# Place all gitconfig here. You can modify the .gitconfig file dynamically, but don't dumbly overwrite it because we want to preserve [user] information.

# git config --global section.key value

git config --global credential.helper store

git config --global init.defaultBranch main

git config --global push.autoSetupRemote true
git config --global push.default current

git config --global pull.rebase false

git config --global submodule.recurse true

function gitconfig-function {
  git config --global alias.$1 "!git_$1() { $2 ;}; git_$1"
}

function gitconfig-alias {
  git config --global alias.$1 "$2"
}

gitconfig-function ignore "curl -sL https://www.toptal.com/developers/gitignore/api/$@"
gitconfig-function superpull "git reset --hard origin/\$(git branch --show-current)"
gitconfig-alias undo "reset --soft HEAD~1"
gitconfig-alias ouch "reset --hard HEAD~1"
gitconfig-alias typo "commit --amend"
gitconfig-alias unstage "restore --staged"
gitconfig-alias branches "branch -l"
gitconfig-alias conflicts "diff --name-only --diff-filter=U"
gitconfig-alias prune "remote prune origin"
