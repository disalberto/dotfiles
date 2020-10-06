#!/bin/bash

export CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export BIN="/usr/local/bin"
export BIN_TMP="$BIN/tmp"


install_sublime() {
  
  SUBLIME="$BIN/sublime_text_3/sublime_text"
  SUBLIME_LN="$BIN/sublime"

  if [ -f $SUBLIME ] 
  then
    echo "Sublime Text 3 already installed"
  else
    echo "Installing Sublime Text 3.."

    sudo mkdir -p $BIN_TMP
    sudo wget --no-check-certificate -qO $BIN_TMP/sublime.tar.bz2 https://download.sublimetext.com/sublime_text_3_build_3211_x64.tar.bz2
    sudo tar -jxf $BIN_TMP/sublime.tar.bz2 -C $BIN
    sudo ln -s $SUBLIME $SUBLIME_LN

    sudo rm -rf $BIN_TMP
  fi

}


install_chrome() {

  INSTALLED=$(/usr/bin/dpkg-query --show --showformat='${db:Status-Status}\n' 'google-chrome-stable')

  if [ $INSTALLED == 'installed' ]
  then
    echo "Google Chrome already installed"
  else
    echo "Installing Google Chrome.."

    sudo mkdir -p $BIN_TMP
    sudo wget -qO $BIN_TMP/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install $BIN_TMP/google-chrome-stable_current_amd64.deb

    sudo rm -rf $BIN_TMP
  fi

}


### To install ###
install_sublime
install_chrome

