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
