#!/bin/bash

export CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export BIN="/usr/local/bin"
export BIN_TMP="$BIN/tmp"

check_installed() {
  /usr/bin/dpkg-query --show --showformat='${db:Status-Status}\n' "$1"
}

install_sublime() {
  
  SUBLIME="$BIN/sublime_text_3/sublime_text"
  SUBLIME_LN="$BIN/sublime"

  if [ -f "$SUBLIME" ]; 
  then
    echo "Sublime Text 3 already installed"
  else
    echo "Installing Sublime Text 3.."

    sudo mkdir -p "$BIN_TMP"
    sudo wget --no-check-certificate -qO "$BIN_TMP/sublime.tar.bz2 https://download.sublimetext.com/sublime_text_3_build_3211_x64.tar.bz2"
    sudo tar -jxf "$BIN_TMP/sublime.tar.bz2" -C "$BIN"
    sudo ln -s "$SUBLIME" "$SUBLIME_LN"

    sudo rm -rf "$BIN_TMP"
  fi

}

install_deb() {
  
  TMP="$CWD/tmp"
  INSTALLED="$(check_installed "$1")"

  if [ "$INSTALLED" == "installed" ];
  then
    echo "$1 already installed"
  else
    echo "Installing $1.."
    
    PKG="$(basename "$2")" 
    
    sudo mkdir -p "$TMP"
    sudo wget -qO "$TMP/$PKG" "$2"
    sudo apt install "$TMP/$PKG"

    sudo rm -rf "$TMP"
  fi

}

install_chrome() {
  install_deb "google-chrome-stable" "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
}

install_qsql() {
  install_deb "q-text-as-data" "https://github.com/harelba/q/releases/download/2.0.19/q-text-as-data_2.0.19-2_amd64.deb"
  install_deb "visidata" "https://github.com/saulpw/deb-vd/raw/master/pool/main/v/visidata/visidata_1.5.2-1_all.deb"
}


### To install ###
install_sublime
install_chrome
install_qsql
