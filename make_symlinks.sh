#!/bin/bash

echo "Restoring .bashrc"
mv ~/.bashrc ~/.bashrc.bak
ln -sv ~/dotfiles/.bashrc ~/.bashrc
`source ~/.bashrc`
