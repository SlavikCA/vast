## MACHINE
vastai show machine 142279
  #  ID      #gpus  gpu_name   disk  hostname  driver     reliab  veri      ip              geoloc              reports  gpuD_$/h  gpuI$/h  rdisc  netu_$/TB  netd_$/TB  occup
  1  142279  2      RTX_4090D  1574  vast4090  610.43.02  0.9942  verified  104.63.172.143  South_Carolina,_US  -        0.60      0.20     0.35   6.14       4.10       x_x_

vastai self-test machine 142279
# --ignore-requirements

Machine: 142279 Done with testing remote.py results DONE
Test completed successfully.

# --price_gpu:  per gpu rental price in $/hour
vastai list machine 142279 --price_gpu 0.60 --discount_rate 0.35 --price_min_bid 0.20 --price_disk 0.20 --price_inetu 0.006 --price_inetd 0.004 --vol_size 1000 --vol_price 0.20  --duration 1month
--end_date 1784721600
vastai unlist machine 142279

# to remove stale/expired contracts from your machine:
vastai cleanup machine 142279
# If that doesn't work you can also try:
vastai delete machine ????

vastai schedule maint 142279 --sdate 1784894400 --duration 4 --maintenance_category internet
vastai show maints -i 142279
vastai cancel maint 142279

## OFFERS

vastai search offers -i "machine_id=142279 verified=any rentable=any"
  #  ID        CUDA   N  Model      PCIE  cpu_ghz  vCPUs   RAM  VRAM  Disk  $/hr    DLP    DLP/$   score  NV Driver  Net_up  Net_down  R     Max_Days  mach_id  status    host_id  ports  country
  1  45040116  13.3  1x  RTX_4090D  11.3  2.4      16.0   96.5  49.1  1445  0.2685  120.4  448.29  608.1  610.43.02  3966.7  4197.8    99.5  14.0      142279   verified  598643   999    South_Carolina,_US

vastai search offers "machine_id=142279 verified=any rentable=any"
  #  ID        CUDA   N  Model      PCIE  cpu_ghz  vCPUs    RAM  VRAM  Disk  $/hr    DLP    DLP/$   score  NV Driver  Net_up  Net_down  R     Max_Days  mach_id  status    host_id  ports  country
  1  49864600  13.3  1x  RTX_4090D  23.9  3.2      8.0     80.5  49.1  790   0.8019  120.4  150.15  208.3  610.43.02  4390.0  4327.0    99.4  30.0      142279   verified  598643   256    South_Carolina,_US
  2  49864599  13.3  2x  RTX_4090D  23.9  3.2      16.0   160.9  49.1  1579  1.6019  230.8  144.08  199.7  610.43.02  4390.0  4327.0    99.4  30.0      142279   verified  598643   256    South_Carolina,_US

curl -s 'https://console.vast.ai/api/v0/bundles' \
   -H 'Authorization: Bearer ???' \
   -d '{"external": {"eq": false}, "machine_id": {"eq": "142279"}, "type": "on-demand"}' | jq

## VOLUMES   https://docs.vast.ai/guides/instances/storage/volumes

vastai search volumes  "machine_id=142279 verified=any"
  #  ID        CUDA  cpu_ghz  Disk B/W  Disk  Disk Name  $/Gb/Month  NV Driver  Net_up  Net_down  R     Max_Days  mach_id  status    host_id  country
  1  45040117  13.3  2.4      2895.8    700   SN850P     0.27        610.43.02  3966.7  4197.8    99.5  11.3      142279   verified  598643   South_Carolina,_US

## INSTANCE

vastai create instance ?? \
 --bid_price 0.27 \
 --image alphaminetech/pearl-miner:1.8.8 \
 --onstart-cmd "/usr/local/bin/entrypoint.sh" \
 --env '-e PEARL_ADDRESS=prl1paw8r8sr6xalvqkw7qa43j3gyfygy8rry6l2vyjwhfw4s6vmpaz5s7gs9jm -e PEARL_WORKER=rtx4090d -e PEARL_DIFFICULTY=1048576 -e PEARL_POOL_HOST=us1.alphapool.tech -e PEARL_POOL_PORT=5566'

./AlphaMiner-Linux-1.9.5.2.run \
  --host us2.alphapool.tech --port 5566 \
  --worker prl1paw8r8sr6xalvqkw7qa43j3gyfygy8rry6l2vyjwhfw4s6vmpaz5s7gs9jm \
  --password "x;d=524288"

vastai create instance 49864599 \
 --image nvidia/cuda:13.3.0-devel-ubuntu24.04 \
 --ssh --direct


vastai search offers "verified=true gpu_name notin [Q_RTX_8000,A40] num_gpus=1 gpu_ram>40 gpu_ram<60 geolocation notin [CN] rentable=false"
# sort by price:
# -o 'dph'
