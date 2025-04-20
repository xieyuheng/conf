https://acavalin.com/p/systemd_noclear
https://mywiki.wooledge.org/SystemdNoClear

```
# show all getty services
systemctl -a | grep getty.*service

# inspect the one we are interested in:
systemctl cat getty@tty1.service
# and note that the VT is cleared by TTYVTDisallocate=yes

# turn this off for all tty by adding a config file:
mkdir /etc/systemd/system/getty@.service.d
echo -en "[Service]\nTTYVTDisallocate=no" > \
  /etc/systemd/system/getty@.service.d/noclear.conf

systemctl daemon-reload # reload units

# reinspect the file and look at the bottom for your changes:
systemctl cat getty@tty1.service

# reboot and enjoy!
```

# Note: You can always see all boot messages with the journalctl command.
