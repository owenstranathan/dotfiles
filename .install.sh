#!/usr/bin/env bash

git clone --bare git@github.com:owenstranathan/dotfiles.git $HOME/.dotfiles

function dotfiles() {
  /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME $@
}

mkdir -p $HOME/.dotfiles-backup

dotfiles checkout

if [ $? = 0 ]; then
  echo "dotfiles checked out.";
else
  echo "backing up prexisting dotfiles.";
  dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{};
fi

dotfiles checkout
dotfiles config status.showUntrackedFiles no

