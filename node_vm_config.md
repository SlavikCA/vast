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

```
agent: 1
balloon: 0
bios: ovmf
boot: order=scsi0
cores: 16
cpu: host
cpulimit: 11
cpuunits: 25
efidisk0: zfs5860:vm-113-disk-0,efitype=4m,size=1M
hostpci0: 0000:55:00,pcie=1
hostpci1: 0000:a2:00.0,pcie=1
machine: q35
memory: 163840
meta: creation-qemu=11.0.3,ctime=1788494409
name: vast4090
net0: virtio=BC:24:11:12:DF:3C,bridge=vmbr0
numa: 0
ostype: l26
scsi0: /dev/disk/by-id/nvme-WD_BLACK_SN850P_for_PS5_2000GB_244308802500,backup=0,discard=on,iothread=1,product=SN850P,size=1953514584K,ssd=1,vendor=WD
scsihw: virtio-scsi-single
smbios1: uuid=644db1ee-9f2d-4de9-b5c8-370c51de586e
sockets: 1
vmgenid: 381d11cc-9b4f-4ab2-8328-531ec199f93c
```