#! /bin/bash
echo "Copy paste stuff you want out of this."
exit 1

#These show the helper hints in the PS1. Stick in .bashrc / etc. to be loaded. Windows only. Can be slow in large repos.
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=1

# Embrace the lazy
cr() { command cd "/f/repos"/"$@"; }
gp() { command git pull; }

#Newer version of git allow you to configure fetch/pull to trim branches for you. Much better.
#Also can alias git fetch -> git fetch --prune
#git config remote.origin.prune true
grpo() { command git remote prune origin; }

# Deletes all non master local branch... this is dangerous. duh.
gcb() { command git branch -l | grep -v master | xargs git branch -D; }

# Full Clean of the repo.
git reset --hard
git submodule foreach --recursive git reset --hard
git submodule update --init --recursive
git clean -xfdf
git submodule foreach --recursive git clean -xfdf
