#!/bin/bash

#USAGE make_symlink sym_target sym_source
make_symlink() {
  if [ -f $2 ]; then
    echo "Backing $2 up..."
    mv $2 $2.backup
  else 
    echo "$2 not present, no need to back it up" 
  fi

  echo "Creating symlink for $2..."
  ln -s $1 $2
}

echo "Restoring .bashrc"
make_symlink ~/.dotfiles/home/.bashrc ~/.bashrc
source ~/.bashrc

echo "Restoring .pam_environment"
make_symlink ~/.dotfiles/home/.pam_environment ~/.pam_environment

echo "Restoring .screenlayout profile for 3 screens"
make_symlink ~/.dotfiles/home/.screenlayout/displaylink_2_externals.sh ~/.screenlayout/displaylink_2_externals.sh
