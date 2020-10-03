#!/bin/bash

localbin="/usr/local/bin"
localbintmp="$localbin/tmp"

mkdir -p $localbintmp

wget --no-check-certificate -qO $localbintmp/sublime.tar.bz2 https://download.sublimetext.com/sublime_text_3_build_3211_x64.tar.bz2

tar jvxf $localbintmp/sublime.tar.bz2 -C $localbin

rm -rf $localbintmp
