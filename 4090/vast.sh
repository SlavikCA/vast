## MACHINE
vastai show machine 142279
  #  ID      #gpus  gpu_name   disk  hostname  driver     reliab  veri      ip              geoloc              reports  gpuD_$/h  gpuI$/h  rdisc  netu_$/TB  netd_$/TB  occup
  1  142279  1      RTX_4090D  1445  vast4090  610.43.02  0.9873  verified  104.63.172.143  South_Carolina,_US  -        1.99      0.20     0.30   6.14       4.10       D_

vastai self-test machine 142279
# --ignore-requirements

Machine: 142279 Done with testing remote.py results DONE
Test completed successfully.

vastai list machine 142279 --price_gpu 0.44 --discount_rate 0.3 --price_min_bid 0.20 --price_disk 0.20 --price_inetu 0.006 --price_inetd 0.004 --duration 2years
vastai list machine 142279 --price_gpu 0.44 --discount_rate 0.3 --price_min_bid 0.20 --price_disk 0.20 --price_inetu 0.006 --price_inetd 0.004 --end_date 1784721600
vastai unlist machine 142279

# to remove stale/expired contracts from your machine:
vastai cleanup machine 142279
# If that doesn't work you can also try:
vastai delete machine ????

vastai schedule maint 142279 --sdate 1784894400 --duration 4 --maintenance_category internet
vastai show maints -i 142279

## OFFERS

vastai search offers -i "machine_id=142279 verified=any"
  #  ID        CUDA   N  Model      PCIE  cpu_ghz  vCPUs   RAM  VRAM  Disk  $/hr    DLP    DLP/$   score  NV Driver  Net_up  Net_down  R     Max_Days  mach_id  status      host_id  ports  country
  1  ??        13.3  1x  RTX_4090D  11.6  2.4      16.0   96.5  49.1  1585  0.2014  120.4  597.77  509.2  610.43.02  867.2   885.3     96.9  177.2     142279   unverified  598643   999    South_Carolina,_US

vastai search offers "machine_id=142279 verified=any"
  #  ID        CUDA   N  Model      PCIE  cpu_ghz  vCPUs   RAM  VRAM  Disk  $/hr    DLP    DLP/$   score  NV Driver  Net_up  Net_down  R     Max_Days  mach_id  status      host_id  ports  country
  1  ??        13.3  1x  RTX_4090D  11.6  2.4      16.0   96.5  49.1  1585  0.3214  120.4  374.57  328.8  610.43.02  867.2   885.3     96.9  177.2     142279   unverified  598643   999    South_Carolina,_US

## VOLUMES   https://docs.vast.ai/guides/instances/storage/volumes

vastai search volumes  "machine_id=142279 verified=any"
  #  ID        CUDA  cpu_ghz  Disk B/W  Disk  Disk Name  $/Gb/Month  NV Driver  Net_up  Net_down  R     Max_Days  mach_id  status    host_id  country
  1  45040117  13.3  2.4      3117.0    722   SN850P     0.27        610.43.02  908.0   924.0     98.7  729.9     142279   verified  598643   South_Carolina,_US

## INSTANCE

vastai create instance ?? \
 --bid_price 0.27 \
 --image alphaminetech/pearl-miner:1.8.8 \
 --onstart-cmd "/usr/local/bin/entrypoint.sh" \
 --env '-e PEARL_ADDRESS=prl1paw8r8sr6xalvqkw7qa43j3gyfygy8rry6l2vyjwhfw4s6vmpaz5s7gs9jm -e PEARL_WORKER=rtx4090d -e PEARL_DIFFICULTY=1048576 -e PEARL_POOL_HOST=us1.alphapool.tech -e PEARL_POOL_PORT=5566'


vastai create instance ?? \
 --image nvidia/cuda:13.3.0-devel-ubuntu24.04 \
 --onstart-cmd "sleep infinity" \
 --ssh --direct
