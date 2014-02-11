#!/bin/sh
#
# ~/.xinitrc
#

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi



### keyboard setting
setxkbmap jp
[ -s $HOME/.xmodmap ] && xmodmap $HOME/.xmodmap
xset r rate 220 28



### scim setting
export XMODIFIERS=@im=SCIM
export GTK_IM_MODULE="scim"
export QT_IM_MODULE="scim"
scim -d



### For VirtualBox
if [ -x /usr/bin/VBoxClient-all ]; then
  /usr/bin/VBoxClient-all
fi



### Screensaver
xscreensaver -no-splash &



### awesome
exec awesome
