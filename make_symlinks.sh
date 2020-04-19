#!/bin/bash

echo "Restoring .bashrc"
mv ~/.bashrc ~/.bashrc.bak
ln -s ~/.dotfiles/home/.bashrc ~/.bashrc
source ~/.bashrc

