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

restore_aliases() {
  echo "Restoring aliases"
  echo -e "\nCustom aliases...\nsource ~/dotfiles/modules/shell/aliases.sh" >> ~/.bashrc
  source ~/.bashrc
}

restore_dot() {
  echo "Restoring $2"
  make_symlink $1 $2
}

### System dependent actions ###

restore_ubuntu() {
  echo "Restoring dotfiles for Ubuntu.."
  #restore_aliases
  ~/dotfiles/modules/shell/missing_sw.sh

}

restore_arch() {
  echo "Restoring dotfiles for Archlinux.."
  restore_aliases
  restore_dot ~/dotfiles/modules/shell/arch/.pam_environment ~/.pam_environment
  restore_dot ~/dotfiles/modules/shell/arch/.xprofile ~/.xprofile
}

