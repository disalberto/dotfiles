#!/bin/bash

#USAGE make_symlink sym_target sym_source

make_backup() {
  if [ -f $1 ]; then
    echo "Backing $1 up..."
    $SUDO mv $1 $1.backup
  else 
    echo "$1 not present, no need to back it up" 
  fi
}

make_symlink() {
  make_backup $2
  echo "Creating symlink for $2..."
  ln -s $1 $2
}

echo "Restoring .bashrc"
make_symlink ~/.dotfiles/modules/shell/.bashrc ~/.bashrc
source ~/.bashrc

echo "Restoring .pam_environment"
make_symlink ~/.dotfiles/modules/shell/.pam_environment ~/.pam_environment

echo "Restoring .xprofile"
make_symlink ~/.dotfiles/modules/shell/.xprofile ~/.xprofile
