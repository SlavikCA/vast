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
