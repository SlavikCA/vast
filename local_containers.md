configure Vast API
=======

```bash
sudo apt install pipx
pipx install vastai
vastai set api-key ??
```

run docker locally:
====================

First, run "dead" load on Vast.

```bash
sudo docker run -d --rm --name ubuntu24 \
  --device=nvidia.com/gpu=all \
  -e NVIDIA_VISIBLE_DEVICES=all \
  -e NVIDIA_DRIVER_CAPABILITIES=compute,utility \
  nvidia/cuda:13.3.0-devel-ubuntu24.04 \
  sleep infinity

sudo docker run -d \
 --device=nvidia.com/gpu=all \
 -e NVIDIA_VISIBLE_DEVICES=all \
 -e NVIDIA_DRIVER_CAPABILITIES=compute,utility \
 -p 3000:3000 -p 9000:9000 \
 --name flux2-dev camenduru/tostui-flux-2-dev
```

Local share
===========
sudo mkdir /mnt/models; sudo chmod 777 /mnt/models
sudo nano /etc/fstab
192.168.0.138:/volume2/models /mnt/models nfs defaults 0 0
sudo mount -a

sudo rsync -av --no-o --no-g /var/lib/docker/.cache/huggingface/hub/models--unsloth--medgemma-27b-it-GGUF /mnt/models/.cache/huggingface/hub/
