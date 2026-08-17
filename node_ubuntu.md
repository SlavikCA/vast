# Typical Ubuntu node config:

```bash
sudo apt install -y qemu-guest-agent  
sudo apt install -y nfs-common git curl openssh-server

# automatic upgrades can break things
sudo apt purge --auto-remove unattended-upgrades -y
sudo systemctl disable apt-daily-upgrade.timer
sudo systemctl disable apt-daily.timer

sudo snap remove firmware-updater
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

```
slavik@vast5090:~$ nvidia-smi
Tue Jun 30 02:02:51 2026       
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 610.43.02              KMD Version: 610.43.02     CUDA UMD Version: 13.3     |
+-----------------------------------------+------------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  NVIDIA GeForce RTX 5090        On  |   00000000:01:00.0 Off |                  N/A |
|  0%   32C    P8             11W /  575W |       1MiB /  32607MiB |      0%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+


slavik@vast4090:~$ nvidia-smi
Thu Jul  2 00:03:27 2026       
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 610.43.02              KMD Version: 610.43.02     CUDA UMD Version: 13.3     |
+-----------------------------------------+------------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  NVIDIA GeForce RTX 4090 D      On  |   00000000:01:00.0 Off |                  Off |
| 90%   68C    P0            224W /  225W |    7974MiB /  49140MiB |    100%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+


slavik@amd9950:~$ sudo nvidia-smi
Mon Aug 17 15:19:50 2026       
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 610.57.04              KMD Version: 610.57.04     CUDA UMD Version: 13.3     |
+-----------------------------------------+------------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  NVIDIA GeForce RTX 5090        On  |   00000000:01:00.0 Off |                  N/A |
|  0%   33C    P8             21W /  600W |   31514MiB /  32607MiB |      0%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+
```
