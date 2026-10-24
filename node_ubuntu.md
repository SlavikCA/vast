# Typical Ubuntu node config:

```bash
# automatic upgrades can break things
sudo apt purge --auto-remove unattended-upgrades -y
sudo systemctl disable apt-daily-upgrade.timer
sudo systemctl disable apt-daily.timer

sudo snap remove firmware-updater

sudo apt install -y qemu-guest-agent nfs-common git curl openssh-server
```

# if GUI present:

```bash
# ensure nothing runs on GPU:
sudo nano /etc/X11/xorg.conf.d/10-no-autogpu.conf

Section "ServerFlags"
    Option "AutoAddGPU" "false"
EndSection

sudo systemctl restart gdm
 
# ignore power events:

sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

sudo nano /etc/gdm3/greeter.dconf-defaults

[org/gnome/settings-daemon/plugins/power]
sleep-inactive-ac-timeout=0

sudo nano /etc/dconf/db/local.d/00-power

[org/gnome/settings-daemon/plugins/power]
sleep-inactive-ac-timeout=0
sleep-inactive-ac-type='nothing'
sleep-inactive-battery-timeout=0
sleep-inactive-battery-type='nothing'

# Optional: also stop laptop lid-close from suspending
lid-close-ac-action='nothing'
lid-close-battery-action='nothing'

sudo nano /etc/dconf/db/local.d/locks/00-power-lock

/org/gnome/settings-daemon/plugins/power/sleep-inactive-ac-timeout
/org/gnome/settings-daemon/plugins/power/sleep-inactive-ac-type
/org/gnome/settings-daemon/plugins/power/sleep-inactive-battery-timeout
/org/gnome/settings-daemon/plugins/power/sleep-inactive-battery-type
/org/gnome/settings-daemon/plugins/power/lid-close-ac-action
/org/gnome/settings-daemon/plugins/power/lid-close-battery-action

sudo nano /etc/systemd/logind.conf

sudo systemctl restart systemd-logind
```

set polkit config

install Beszel

# install_nvidia.sh
