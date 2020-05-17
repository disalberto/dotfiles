#!/bin/bash

$HOME/.dotfiles/home/.screenlayout/displaylink_2_externals.sh

sudo modprobe udl

xrandr --listproviders

reboot
