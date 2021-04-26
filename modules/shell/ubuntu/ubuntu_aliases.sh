#!/bin/bash

alias aptupd="sudo apt-get update"
alias aptupg="sudo apt-get upgrade"
alias aptpur="sudo apt-get purge"
alias aptaut="sudo apt-get autoremove"
alias aptins="sudo apt-get install"
alias aptrem="sudo apt-get remove"
alias aptkey="sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys"

animations() {
  gsettings set org.gnome.desktop.interface enable-animations $1
}

disable_animations() {
  animations false
}

enable_animations() {
  animations true
}

add_vb_group() {
  sudo adduser $(whoami) vboxsf
}

disable_wayland() {
  sudo sed -i '/#WaylandEnable=false/s/^#//g' /etc/gdm3/custom.conf
  sudo systemctl restart gdm3
}

deb_install() {
  sudo dpkg -i $1
}
