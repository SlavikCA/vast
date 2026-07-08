on VM:

# 4090
hostpci0: 0000:04:00,pcie=1,rombar=0
# 5090
hostpci0: 0000:16:00,pcie=1

####################### nVidia
lspci | grep -i nvidia
printf 'blacklist nouveau\noptions nouveau modeset=0\noptions nvidia-drm modeset=0\n' | sudo tee /etc/modprobe.d/blacklist-nouveau.conf
sudo update-initramfs -u
sudo reboot

# https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html
# https://developer.nvidia.com/cudnn-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=24.04&target_type=deb_network
sudo apt-get install -y linux-headers-$(uname -r)
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update

# 5090:
sudo apt-get install -y nvidia-open nvtop

# 4090:
sudo apt-get install -y nvidia-driver nvtop
echo 'options nvidia NVreg_EnableGpuFirmware=0' | sudo tee /etc/modprobe.d/nvidia-disable-gsp.conf
sudo update-initramfs -u

sudo reboot

# https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg   && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list |     sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' |     sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit

# Drivers:
nvidia-smi

# Force RTX 5090 functions to stay in D0 and block deepest sleep
nano /etc/udev/rules.d/99-vfio-gpu-pm.rules

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{device}=="0x2b85", ATTR{power/control}="on", ATTR{d3cold_allowed}="0"
ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{device}=="0x22e8", ATTR{power/control}="on", ATTR{d3cold_allowed}="0"

udevadm control --reload-rules
udevadm trigger -s pci
