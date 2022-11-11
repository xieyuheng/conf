#!/bin/sh

xrdb -merge "${HOME}/.Xresources" &

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export XDG_DESKTOP_DIR="/home/xyh"

/usr/lib/xfce4/notifyd/xfce4-notifyd &
# dunst &
# /usr/lib/notification-daemon-1.0/notification-daemon &
# rmdir Desktop &
fcitx5 &
xmodmap .xmodmap &
xbindkeys &
nm-applet &
cbatticon &
~/.wallpapers/random-wallpaper.sh &
# xcompmgr &
# compton -bc &
# xscreensaver -no-splash &

# for firefox
export MOZ_USE_XINPUT2=1
# XDG_DESKTOP_DIR="/home/xyh"

# for gnome
# export XDG_SESSION_TYPE=x11
# export GDK_BACKEND=x11
# exec gnome-session

# for kde
# export DESKTOP_SESSION=plasma
# exec startplasma-x11

# exec startxfce4

exec i3
