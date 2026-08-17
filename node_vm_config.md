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
