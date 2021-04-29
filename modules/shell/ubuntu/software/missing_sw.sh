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


install_pyenv() {

  #check installation
  if [ -z "$(which pyenv)" ]
  then
    # install dependencies
    sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev

    #clone the repo
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv

    echo '' >> ~/.bashrc
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bashrc

    echo "Installed $(pyenv -v)"

    reset_shell="y"
  else
    echo "Pyenv already installed : $(pyenv -v)"
  fi


  venv_v="$(pyenv virtualenv --version)"
  [[ "$venv_v" =~ pyenv-virtualenv\ ([0-9]+\.[0-9]+\.[0-9]+) ]] && version="${BASH_REMATCH[1]}"

  if [ -z "$version" ]
  then
    # clone repo
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

    echo "Installed pyenv-virtualenv $(pyenv virtualenv --version)"
    reset_shell="y"
  else
    echo "Pyenv-virtualenv already installed: $(pyenv virtualenv --version)"
  fi

  if [ "$reset_shell" == "y" ]
  then
    # restart shell
    exec "$SHELL"
  fi

}

snap_install() {
  sudo snap instal "$1" --classic
}

install_chrome() {
  install_deb "google-chrome-stable" "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
}

install_qsql() {
  install_deb "q-text-as-data" "https://github.com/harelba/q/releases/download/2.0.19/q-text-as-data_2.0.19-2_amd64.deb"
  install_deb "visidata" "https://github.com/saulpw/deb-vd/raw/master/pool/main/v/visidata/visidata_1.5.2-1_all.deb"
}

install_intellij_ultimate(){
 snap_install intellij-idea-ultimate
}


### To install ###
install_sublime
install_chrome
install_qsql
install_pyenv
#install_intellij_ultimate
