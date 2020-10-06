#!/bin/bash

source ./modules/shell/restore_dotfiles.sh

export OS=$(lsb_release -i | cut -f 2-)

echo "Running on: $OS"


restore $OS

