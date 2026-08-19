## MACHINE
vastai show machine 147987
  #  ID      #gpus  gpu_name  disk  hostname  driver     reliab  veri        ip              geoloc              reports  gpuD_$/h  gpuI$/h  rdisc  netu_$/TB  netd_$/TB  occup
  1  147987  1      RTX_5090  2765  vast5090  610.43.02  0.9923  unverified  104.63.172.143  South_Carolina,_US  -        0.37      0.20     0.30   6.14       4.10       x_

vastai self-test machine 147987
# --ignore-requirements
Machine: 147987 Done with testing remote.py results DONE
Test completed successfully.

# --price_gpu 0.37 == 0.4952
# --price_gpu 0.31 == 0.4152
vastai list machine 147987 --price_gpu 0.33 --discount_rate 0.3 --price_min_bid 0.20 --price_disk 0.20 --price_inetu 0.006 --price_inetd 0.004 --vol_size 1500 --vol_price 0.20  --duration 2month
# --duration 2years
# --end_date 1784721600
vastai unlist machine 147987

# to remove stale/expired contracts from your machine:
vastai cleanup machine 147987

vastai schedule maint 147987 --sdate 1784894400 --duration 4 --maintenance_category internet
vastai show maints -i 147987
vastai cancel maint 147987

# run vastai cleanup machine [id] in the cli After the 48 hours
# Otherwise you still take the reliability hit

## OFFERS

vastai search offers -i "machine_id=147987 verified=any rentable=any"
  #  ID        CUDA   N  Model     PCIE  cpu_ghz  vCPUs    RAM  VRAM  Disk  $/hr    DLP    DLP/$   score  NV Driver  Net_up  Net_down  R     Max_Days  mach_id  status      host_id  ports  country
  1  45046506  13.3  1x  RTX_5090  53.7  3.2      10.0   386.7  32.6  2765  0.2685  181.0  673.93  624.8  610.43.02  1204.0  1195.0    99.2  730.0     147987   unverified  598643   998    South_Carolina,_US

vastai search offers "machine_id=147987 verified=any rentable=any"
  #  ID        CUDA   N  Model     PCIE  cpu_ghz  vCPUs    RAM  VRAM  Disk  $/hr    DLP    DLP/$   score  NV Driver  Net_up  Net_down  R     Max_Days  mach_id  status      host_id  ports  country
  1  45046506  13.3  1x  RTX_5090  53.7  3.2      10.0   386.7  32.6  2765  0.3885  181.1  466.22  473.4  610.43.02  1601.6  1536.9    99.2  730.0     147987   unverified  598643   998    South_Carolina,_US

## VOLUMES   https://docs.vast.ai/guides/instances/storage/volumes

vastai search volumes  "machine_id=147987 verified=any"
  #  ID        CUDA  cpu_ghz  Disk B/W  Disk  Disk Name    $/Gb/Month  NV Driver  Net_up  Net_down  R     Max_Days  mach_id  status      host_id  country
  1  45046507  13.3  3.2      4005.2    1500  MP700_ELITE  0.27        610.43.02  1204.0  1195.0    99.2  730.0     147987   deverified  598643   South_Carolina,_US