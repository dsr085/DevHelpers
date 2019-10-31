#! /bin/bash
echo "Copy paste stuff you want out of this."
exit 1

#These show the helper hints in the PS1. Stick in .bashrc / etc. to be loaded.
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=1

# Embrace the lazy
cr() { command cd "/f/repos"/"$@"; }
gp() { command git pull; }
grpo() { command git remote prune origin; }

# Deletes all non master local branch... this is dangerous. duh.
gcb() { command git branch -l | grep -v master | xargs git branch -D; }

# Full Clean of the repo.
git reset --hard
git submodule foreach --recursive git reset --hard
git submodule update --init --recursive
git clean -xfdf
git submodule foreach --recursive git clean -xfdf