Vast API
=======

pipx install vastai --python python3.11

set API key first

```bash
vastai search offers -i "machine_id=142279 verified=any"
  #  ID        CUDA   N  Model      PCIE  cpu_ghz  vCPUs   RAM  VRAM  Disk  $/hr    DLP    DLP/$   score  NV Driver  Net_up  Net_down  R     Max_Days  mach_id  status      host_id  ports  country           
  1  43450401  13.3  1x  RTX_4090D  11.6  2.4      16.0   96.5  49.1  1585  0.2681  120.4  449.07  92.9   610.43.02  468.2   470.8     60.0  184.0     142279   unverified  598643   999    South_Carolina,_US

vastai search offers "machine_id=142279 verified=any"
  #  ID        CUDA   N  Model      PCIE  cpu_ghz  vCPUs   RAM  VRAM  Disk  $/hr    DLP    DLP/$   score  NV Driver  Net_up  Net_down  R     Max_Days  mach_id  status      host_id  ports  country           
  1  43450401  13.3  1x  RTX_4090D  11.6  2.4      16.0   96.5  49.1  1585  0.5347  120.4  225.12  49.0   610.43.02  468.2   470.8     60.0  184.0     142279   unverified  598643   999    South_Carolina,_US

vastai list machine 142279 --price_gpu 0.30 --price_min_bid 0.15 --price_disk 0.15 
vastai show machine 142279

  #  ID      #gpus  gpu_name  disk  hostname  driver     reliab  veri        ip              geoloc              reports  gpuD_$/h  gpuI$/h  rdisc  netu_$/TB  netd_$/TB  occup
  1  142279  1      RTX_5090  3251  vast5090  610.43.02  0.6000  unverified  104.63.172.143  South_Carolina,_US  -        0.42      0.15     0.00   3.00       2.00       x_   

vastai self-test machine 142279 --ignore-requirements

vastai cleanup machine 142279

vastai create instance 43450401 \
 --bid_price 0.27 \
 --image alphaminetech/pearl-miner:1.8.6 \
 --onstart-cmd "/usr/local/bin/entrypoint.sh" \
 --env '-e PEARL_ADDRESS=prl1paw8r8sr6xalvqkw7qa43j3gyfygy8rry6l2vyjwhfw4s6vmpaz5s7gs9jm -e PEARL_WORKER=rtx4090 -e PEARL_DIFFICULTY=1048576 -e PEARL_POOL_HOST=us1.alphapool.tech -e PEARL_POOL_PORT=5566'


vastai create instance 43450401 \
 --image nvidia/cuda:13.3.0-devel-ubuntu24.04 \
 --onstart-cmd "sleep infinity" \
 --ssh --direct

# to remove stale/expired contracts from your machine:
vastai cleanup machine 142279

# If that doesn't work you can also try:
vastai delete machine 142279
```

run docker directly:
====================

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
