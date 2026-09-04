## MACHINE
vastai show machine 142067
  #  ID      #gpus  gpu_name  disk  hostname  driver     reliab  veri      ip              geoloc              reports  gpuD_$/h  gpuI$/h  rdisc  netu_$/TB  netd_$/TB  occup
  1  142067  1      RTX_5090  2484  vast5090  610.43.02  0.9969  verified  104.63.172.143  South_Carolina,_US  -        0.49      0.30     0.30   6.14       4.10       D_   

vastai self-test machine 142067
# --ignore-requirements
Machine: 142067 Done with testing remote.py results DONE
Test completed successfully.

# --price_gpu 0.37 == 0.4952
# --price_gpu 0.31 == 0.4152
vastai list machine 142067 --price_gpu 0.60 --discount_rate 0.3 --price_min_bid 0.30 --price_disk 0.20 --price_inetu 0.006 --price_inetd 0.004 --vol_size 1500 --vol_price 0.20  --duration 12month
# --end_date 1784721600
vastai unlist machine 142067

# to remove stale/expired contracts from your machine:
vastai cleanup machine 142067

vastai schedule maint 142067 --sdate 1784894400 --duration 4 --maintenance_category internet
vastai show maints -i 142067
vastai cancel maint 142067

# run vastai cleanup machine [id] in the cli After the 48 hours
# Otherwise you still take the reliability hit

## OFFERS

vastai search offers -i "machine_id=142067 verified=any rentable=any"
  #  ID        CUDA   N  Model     PCIE  cpu_ghz  vCPUs   RAM  VRAM  Disk  $/hr    DLP    DLP/$   score  NV Driver  Net_up  Net_down  R     Max_Days  mach_id  status    host_id  ports  country
  1  49537970  13.3  1x  RTX_5090  53.6  -        16.0   64.2  32.6  2429  0.4019  147.3  366.61  369.1  610.43.02  4326.0  4593.3    97.7  360.0     142067   verified  598643   256    South_Carolina,_US

vastai search offers "machine_id=142067 verified=any rentable=any"
  #  ID        CUDA   N  Model     PCIE  cpu_ghz  vCPUs   RAM  VRAM  Disk  $/hr    DLP    DLP/$   score  NV Driver  Net_up  Net_down  R     Max_Days  mach_id  status    host_id  ports  country
  1  49537970  13.3  1x  RTX_5090  53.6  -        16.0   64.2  32.6  2429  0.6552  147.3  224.86  227.1  610.43.02  4326.0  4593.3    97.7  360.0     142067   verified  598643   256    South_Carolina,_US

## VOLUMES   https://docs.vast.ai/guides/instances/storage/volumes

vastai search volumes  "machine_id=142067 verified=any"
  #  ID        CUDA  cpu_ghz  Disk B/W  Disk  Disk Name    $/Gb/Month  NV Driver  Net_up  Net_down  R     Max_Days  mach_id  status    host_id  country
  1  49537972  13.3  -        4374.0    1500  MP700_ELITE  0.27        610.43.02  4326.0  4593.3    97.7  360.0     142067   verified  598643   South_Carolina,_US

## INSTANCE

# https://github.com/AlphaMine-Tech/alpha-miner/releases
vastai create instance 45046506 \
 --bid_price 0.27 \
 --image alphaminetech/pearl-miner:1.8.8 \
 --onstart-cmd "/usr/local/bin/entrypoint.sh" \
 --env '-e PEARL_ADDRESS=prl1paw8r8sr6xalvqkw7qa43j3gyfygy8rry6l2vyjwhfw4s6vmpaz5s7gs9jm -e PEARL_WORKER=rtx5090 -e PEARL_DIFFICULTY=1048576 -e PEARL_POOL_HOST=us1.alphapool.tech -e PEARL_POOL_PORT=5566'


vastai create instance 45046506 \
 --image nvidia/cuda:13.3.0-devel-ubuntu24.04 \
 --ssh --direct

curl -X PUT 'https://console.vast.ai/api/v0/asks/45046506/' \
   -H "Authorization: Bearer $VAST_API_KEY" \
   -d '{"client_id": "me", "image": "nvidia/cuda:13.3.0-devel-ubuntu24.04", "env": {}, "price": null, "disk": 10, "runtype": "ssh_direct ssh_proxy"}'

vastai search offers "verified=false gpu_name in [RTX_5090] num_gpus=1 geolocation in [US] rentable=true"
vastai search offers "verified=false gpu_name in [RTX_5090] num_gpus=1 geolocation in [US] rentable=true cuda_vers=13.3"
# machine_id=142067"
# -o 'dph'
