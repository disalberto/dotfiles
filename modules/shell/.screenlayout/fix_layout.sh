#!/bin/bash

#$HOME/.dotfiles/modules/shell/.screenlayout/displaylink_2_externals.sh
$HOME/.dotfiles/modules/shell/.screenlayout/displaylink_hdmi_laptop.sh

echo 'udl' | sudo tee /etc/modules-load.d/udl.conf

sudo modprobe udl
sudo modprobe evdi

#xrandr --current
xrandr --listproviders

reboot
