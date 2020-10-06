#!/bin/bash

BIN="/usr/local/bin"
BIN_TMP="$BIN/tmp"

mkdir -p $BIN_TMP

wget --no-check-certificate -qO $BIN_TMP/sublime.tar.bz2 https://download.sublimetext.com/sublime_text_3_build_3211_x64.tar.bz2

tar jvxf $BIN_TMP/sublime.tar.bz2 -C $BIN

rm -rf $BIN_TMP
