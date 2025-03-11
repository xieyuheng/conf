删除不用的 app：

```
sudo apt remove plymouth plymouth-themes
sudo apt remove desktop-base
sudo apt purge "libreoffice*"
sudo apt purge "gnome*"
```

配置下面的服务可以在启动时保留 log：

```
systemctl edit getty@.service
```
