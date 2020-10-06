#!/bin/bash

#Sublime Text 3
install_sublime() {
  
  BIN="/usr/local/bin"
  SUBLIME="$BIN/sublime_text_3/sublime_text"
  SUBLIME_LN="$BIN/sublime"
  CWD="$(dirname $0)"

  mkdir -p $BIN

  if [ -f $SUBLIME ] 
  then
    echo "Sublime Text 3 already installed"
  else
    echo "Installing Sublime Text 3"
    sudo $CWD/install_sublime.sh
  fi

  sudo ln -s $SUBLIME $SUBLIME_LN 

}


### To install ###
#install_sublime

