#!/bin/bash

echo "Updating configuration file..."
cp /home/disalberto/.config/spotify/Users/alberto88a-user/prefs /home/disalberto/.config/spotify/Users/alberto88a-user/prefs.backup

cp -f ./alberto88a-user.prefs /home/disalberto/.config/spotify/Users/alberto88a-user/prefs
