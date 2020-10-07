#!/bin/bash


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
