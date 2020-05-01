#!/bin/bash


add() {
  killX
  echo "Adding new shortcuts..."
  cp -f /home/disalberto/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml /home/disalberto/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml.backup
  
  xmlstarlet ed --inplace -d "//channel[@name='xfce4-keyboard-shortcuts']/property[@name='commands']/property[@name='custom']/property1" \
    -a "//channel[@name='xfce4-keyboard-shortcuts']/property[@name='commands']/property[@name='custom']/property[last()]" -t elem -n 'property'  -v '' \
    -a "//channel[@name='xfce4-keyboard-shortcuts']/property[@name='commands']/property[@name='custom']/property[last()]" -t attr -n 'name' -v '<Super>x' \
    -a "//channel[@name='xfce4-keyboard-shortcuts']/property[@name='commands']/property[@name='custom']/property[last()]" -t attr -n 'type' -v 'string' \
    -a "//channel[@name='xfce4-keyboard-shortcuts']/property[@name='commands']/property[@name='custom']/property[last()]" -t attr -n 'value' -v '/usr/bin/xfce4-terminal' \
    /home/disalberto/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
  restoreX
}

restore() {
  killX	
  echo "Restoring original shortcuts..."
  cp -f /home/disalberto/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml.backup /home/disalberto/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
  rm /home/disalberto/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml.backup 
  restoreX
}

killX() {
  echo "Killing processes..."
  kill -9 $(pidof  xfconfd)
  kill -9 $(pidof  xfsettingsd)
}

restoreX() {
  xfsettingsd &	
  /usr/lib/xfce4/xfconf/xfconfd &
}
