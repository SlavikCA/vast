# https://cloud.vast.ai/host/setup/

# https://cloud.vast.ai/cli/

ISO: https://releases.ubuntu.com/noble/ubuntu-24.04.4-live-server-amd64.iso

### VM

Create VM:
```
bios: ovmf
machine: q35
cpu: host
balloon: 0
hostpci0: 0000:ac:00,pcie=1
EFI without secureboot
```

```
# delete partitions:
wipefs -a /dev/nvme0n1
ls -la /dev/disk/by-id/ | grep nvme0n1

VM=112

qm set $VM --scsi0 /dev/disk/by-id/nvme-WD_BLACK_SN850P_for_PS5_2000GB_244308802500,iothread=on,product=SN850P,ssd=1,vendor=WD,discard=on
qm set $VM --scsi0 /dev/disk/by-id/nvme-Corsair_MP700_ELITE_AA0FB538001EFR,iothread=on,product=MP700_ELITE,ssd=1,vendor=Corsair,discard=on
#  ,cache=writeback
```


### CONFIG

```
sudo apt install -y qemu-guest-agent  nfs-common  git
sudo apt purge --auto-remove unattended-upgrades -y
sudo systemctl disable apt-daily-upgrade.timer
sudo systemctl mask apt-daily-upgrade.service
sudo systemctl disable apt-daily.timer
sudo systemctl mask apt-daily.service
```

[install nvidia](./install_nvidia.sh)

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

+-----------------------------------------------------------------------------------------+
| Processes:                                                                              |
|  GPU   GI   CI              PID   Type   Process name                        GPU Memory |
|        ID   ID                                                               Usage      |
|=========================================================================================|
|  No running processes found                                                             |
+-----------------------------------------------------------------------------------------+
```
