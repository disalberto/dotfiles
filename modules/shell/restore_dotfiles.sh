#!/bin/bash

CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

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

restore_common_aliases() {
  echo "Restoring aliases"
  echo -e "\n#Custom aliases...\nsource $CWD/aliases.sh" >> ~/.bashrc
  #source ~/.bashrc
}

restore_common_dotfiles() {
  echo "Restoring .gitconfig"
  restore_dot $CWD/common/.gitconfig ~/.gitconfig
}

restore_dot() {
  echo "Restoring $2"
  make_symlink $1 $2
}

### System dependent actions ###

restore() {
  OS=$1

  restore_common_aliases
  restore_common_dotfiles

  if [ "$OS" == "Ubuntu" ]
  then
    restore_ubuntu
  elif [ "$OS" == "archlinux" ]
  then
    restore_arch
  elif [ "$OS" == "Debian" ] #RaspberryOS
  then
    restore_debian
  else
    echo "Unsupported OS";
  fi

}

restore_debian() {
  # only aliases for the moment
  echo "Nothing to restore for the moment on this Debian distro. :)"
}

restore_ubuntu() {

  UBUNTU_DIR="$CWD/ubuntu"
  UBUNTU_SW="$UBUNTU_DIR/software"

  echo "Restoring softwares.."
  $UBUNTU_SW/missing_sw.sh

  echo "Restoring aliases.."
  echo -e "\nsource $UBUNTU_DIR/ubuntu_aliases.sh" >> ~/.bashrc
  source ~/.bashrc

}

restore_arch() {

  ARCH_DIR="$CWD/arch"

  echo "Restoring dotfiles for Archlinux.."
  restore_dot $CWD/arch/.pam_environment ~/.pam_environment
  restore_dot $CWD/arch/.xprofile ~/.xprofile

  echo "Restoring aliases.."
  echo -e "\nsource $ARCH_DIR/arch_aliases.sh" >> ~/.bashrc
  source ~/.bashrc

}

