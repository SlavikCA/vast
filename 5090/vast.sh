## MACHINE
vastai show machine 142067
  #  ID      #gpus  gpu_name  disk  hostname  driver     reliab  veri        ip              geoloc              reports  gpuD_$/h  gpuI$/h  rdisc  netu_$/TB  netd_$/TB  occup
  1  142067  1      RTX_5090  3236  vast5090  610.43.02  0.9871  unverified  104.63.172.143  South_Carolina,_US  -        0.99      0.20     0.30   3.00       2.00       I_

vastai self-test machine 142067 --ignore-requirements
Machine: 142067 Done with testing remote.py results DONE
Test completed successfully.

vastai list machine 142067 --price_gpu 1.99 --discount_rate 0.3 --price_min_bid 0.20 --price_disk 0.20 --duration 2years
vastai unlist machine 142067

# to remove stale/expired contracts from your machine:
vastai cleanup machine 142067

vastai show maints -i 142067

## OFFERS

vastai search offers -i "machine_id=142067 verified=any"
  #  ID        CUDA   N  Model     PCIE  cpu_ghz  vCPUs    RAM  VRAM  Disk  $/hr    DLP    DLP/$   score  NV Driver  Net_up  Net_down  R     Max_Days  mach_id  status      host_id  ports  country
  1  45046506  13.3  1x  RTX_5090  53.6  3.2      10.0   386.7  32.6  3240  0.2719  140.3  516.09  508.7  610.43.02  1199.6  1226.1    98.8  730.0     142067   unverified  598643   998    South_Carolina,_US

vastai search offers "machine_id=142067 verified=any"
  #  ID        CUDA   N  Model     PCIE  cpu_ghz  vCPUs    RAM  VRAM  Disk  $/hr    DLP    DLP/$  score  NV Driver  Net_up  Net_down  R     Max_Days  mach_id  status      host_id  ports  country
  1  45046506  13.3  1x  RTX_5090  53.6  3.2      10.0   386.7  32.6  3240  2.6552  140.3  52.84  51.5   610.43.02  1199.6  1226.1    98.8  730.0     142067   unverified  598643   998    South_Carolina,_US

## VOLUMES   https://docs.vast.ai/guides/instances/storage/volumes

vastai search volumes  "machine_id=142067 verified=any"
  #  ID        CUDA  cpu_ghz  Disk B/W  Disk  Disk Name    $/Gb/Month  NV Driver  Net_up  Net_down  R     Max_Days  mach_id  status      host_id  country
  1  45046507  13.3  3.2      4769.0    1625  MP700_ELITE  0.27        610.43.02  1199.6  1226.1    98.8  730.0     142067   unverified  598643   South_Carolina,_US

## INSTANCE

# https://github.com/AlphaMine-Tech/alpha-miner/releases
vastai create instance 45046506 \
 --bid_price 0.27 \
 --image alphaminetech/pearl-miner:1.8.8 \
 --onstart-cmd "/usr/local/bin/entrypoint.sh" \
 --env '-e PEARL_ADDRESS=prl1paw8r8sr6xalvqkw7qa43j3gyfygy8rry6l2vyjwhfw4s6vmpaz5s7gs9jm -e PEARL_WORKER=rtx5090 -e PEARL_DIFFICULTY=1048576 -e PEARL_POOL_HOST=us1.alphapool.tech -e PEARL_POOL_PORT=5566'


vastai create instance 45046506 \
 --image nvidia/cuda:13.3.0-devel-ubuntu24.04 \
 --onstart-cmd "sleep infinity" \
 --ssh --direct
