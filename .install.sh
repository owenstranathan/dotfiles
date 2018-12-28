#!/usr/bin/env bash

repo="git@github.com:owenstranathan/dotfiles.git"
echo "Cloning repository $repo"

BACKUP_DIR=$HOME/.dotfiles-backup$(date +"%s")
mkdir -p ${BACKUP_DIR}

if [[ -d "$HOME/.dotfiles" ]]; then
  mv $HOME/.dotfiles "$BACKUP_DIR"
fi

dotfiles checkout > /dev/null 2>&1

git clone --bare $repo $HOME/.dotfiles

function dotfiles() {
  /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME $@
}

echo "Checking out out files to $HOME"
if [[ "$?" = 0 ]]; then
  echo "dotfiles checked out.";
else
  echo "$HOME contains files that would be overwritten by checkout"
  echo "Moving them to $BACKUP_DIR"
  paths=$(dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'}) # | xargs -I{} mkdir -p `dirname {}` && mv {} .dotfiles-backup/{};
  for path in $paths; do
    echo "Moving $path to ${BACKUP_DIR}/$path"
    mkdir -p ${BACKUP_DIR}/$(dirname $path)
    mv $path ${BACKUP_DIR}/$path
  done
  dotfiles checkout
  if [[ "$?" = 0 ]]; then
    echo "dotfiles checked out.";
  fi
fi

dotfiles reset --hard HEAD
dotfiles submodule update --init --recursive

dotfiles config status.showUntrackedFiles no

echo "dotfiles installed"


