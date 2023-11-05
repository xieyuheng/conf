https://bbs.archlinux.org/viewtopic.php?pid=1954864

```
journalctl --user -u xdg-desktop-portal-gtk --no-pager
```

```
systemctl --user mask xdg-desktop-portal-gtk.service
systemctl --user unmask xdg-desktop-portal-gtk.service
```

> Created symlink /home/sil/.config/systemd/user/xdg-desktop-portal-gtk.service → /dev/null.

see: https://wiki.archlinux.org/title/XDG_Desktop_Portal

Or

```
sudo apt remove xdg-desktop-portal
```
