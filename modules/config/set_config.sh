#!/bin/bash

# USAGE: 
# bash set_config.sh source_config dest_config n


backup_and_save() {
  SUDO=""
  echo "Command to be executed as sudo: ${3:-n}"
  if [ "$3" = "y" ]; then
    SUDO="sudo"
  fi 

  echo "Updating configuration file... $2"
  if test -f "$2"; then
    $SUDO mv $2 $2.backup
  fi
  $SUDO ln -s $1 $2
}


echo "#1: Spotify"
backup_and_save $HOME/.dotfiles/modules/config/spotify/alberto88a-user.prefs $HOME/.config/spotify/Users/alberto88a-user/prefs

#echo "#2: DisplayLink"
#backup_and_save $HOME/.dotfiles/modules/config/displaylink/20-evdidevice.conf /usr/share/X11/xorg.conf.d/20-evdidevice.conf y
