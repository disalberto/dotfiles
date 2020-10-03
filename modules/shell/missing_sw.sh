#!/bin/bash

#Sublime Text 3
sublime() {
  
  sublime="/usr/local/bin/sublime_text_3/sublime_text"
  
  if [ -f $sublime ] 
  then
    echo "Sublime Text 3 already installed"
  else
    echo "Installing Sublime Text 3"
    sudo ~/.dotfiles/modules/shell/install_sublime.sh
  fi

  alias sublime="$sublime"
}
