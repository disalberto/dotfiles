#!/bin/bash

source ./modules/shell/restore_dotfiles.sh

export OS=$(lsb_release -i | cut -f 2-)

echo "Running on: $OS"


if [ "$OS" == "Ubuntu" ]
then
  restore_ubuntu
elif [ "$OS" == "archlinux" ]
then
  restore_arch
else
  echo "Unsupported OS";
fi


