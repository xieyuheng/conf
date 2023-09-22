#!/bin/sh

export PATH=$PATH:$HOME/bin
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export XDG_DESKTOP_DIR="/home/xyh"
export MOZ_USE_XINPUT2=1

xrdb -merge "${HOME}/.Xresources" &
fcitx5 &
xmodmap .xmodmap &
xbindkeys &
nm-applet &
cbatticon --icon-type symbolic --hide-notification --low-level 30 --critical-level 10 &
~/.wallpapers/random-wallpaper.sh &
# xcompmgr &
# compton -bc &
# xscreensaver -no-splash &

# for gnome
# export XDG_SESSION_TYPE=x11
# export GDK_BACKEND=x11
# exec gnome-session

# for kde
# export DESKTOP_SESSION=plasma
# exec startplasma-x11

# for xfce4
# exec startxfce4

exec i3
