#!/usr/bin/env bash

git clone --bare git@github.com:owenstranathan/dotfiles.git $HOME/.dotfiles

function dotfiles() {
  /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME $@
}

BACKUP_DIR=$HOME/.dotfiles-backup
mkdir -p ${BACKUP_DIR}

dotfiles checkout

if [ $? = 0 ]; then
  echo "dotfiles checked out.";
else
  echo "backing up prexisting dotfiles.";
  paths = $(dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'}) # | xargs -I{} mkdir -p `dirname {}` && mv {} .dotfiles-backup/{};
  for path in $paths; do
    mkdir -p ${BACKUP_DIR}/$(dirname $path)
    mv $path ${BACKUP_DIR}/$path
  done
fi

dotfiles checkout
dotfiles config status.showUntrackedFiles no

