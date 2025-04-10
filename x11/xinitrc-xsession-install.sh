#!/bin/bash

echo installing xinitrc-xsession
git clone https://aur.archlinux.org/xinit-xsession.git /tmp/xinit-xsession
cd /tmp/xinit-xsession

sudo cp xinitrcsession-helper /usr/bin/
sudo chmod +x /usr/bin/xinitrcsession-helper

sudo cp xinitrc.desktop /usr/share/xsessions/

touch ~/.xinitrc
chmod +x ~/.xinitrc

echo installed xinitrc-xsession
