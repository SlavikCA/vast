vastai search offers -i "machine_id=142067 verified=any"
  #  ID        CUDA   N  Model     PCIE  cpu_ghz  vCPUs    RAM  VRAM  Disk  $/hr    DLP    DLP/$   score  NV Driver  Net_up  Net_down  R     Max_Days  mach_id  status      host_id  ports  country              
  1  43155579  13.3  1x  RTX_5090  53.7  3.2      10.0   386.7  32.6  3252  0.2014  140.1  695.74  366.8  610.43.02  1054.3  1070.3    90.0  181.8     142067   unverified  598643   998    South_Carolina,_US

vastai search offers "machine_id=142067 verified=any"
  #  ID        CUDA   N  Model     PCIE  cpu_ghz  vCPUs    RAM  VRAM  Disk  $/hr    DLP    DLP/$   score  NV Driver  Net_up  Net_down  R     Max_Days  mach_id  status      host_id  ports  country           
  1  43155579  13.3  1x  RTX_5090  53.7  3.2      10.0   386.7  32.6  3252  0.4014  140.1  349.08  186.2  610.43.02  1054.3  1070.3    90.0  181.8     142067   unverified  598643   998    South_Carolina,_US

vastai list machine 142067 --price_gpu 0.45 --price_min_bid 0.15 --price_disk 0.15
vastai show machine 142067

  #  ID      #gpus  gpu_name  disk  hostname  driver     reliab  veri        ip              geoloc              reports  gpuD_$/h  gpuI$/h  rdisc  netu_$/TB  netd_$/TB  occup
  1  142067  1      RTX_5090  3251  vast5090  610.43.02  0.6000  unverified  104.63.172.143  South_Carolina,_US  -        0.42      0.15     0.00   3.00       2.00       x_   

vastai self-test machine 142067 --ignore-requirements

vastai cleanup machine 142067

vastai create instance 43155579 \
 --bid_price 0.27 \
 --image alphaminetech/pearl-miner:1.8.6 \
 --onstart-cmd "/usr/local/bin/entrypoint.sh" \
 --env '-e PEARL_ADDRESS=prl1paw8r8sr6xalvqkw7qa43j3gyfygy8rry6l2vyjwhfw4s6vmpaz5s7gs9jm -e PEARL_WORKER=rtx5090 -e PEARL_DIFFICULTY=1048576 -e PEARL_POOL_HOST=us1.alphapool.tech -e PEARL_POOL_PORT=5566'


vastai create instance 43155579 \
 --image nvidia/cuda:13.3.0-devel-ubuntu24.04 \
 --onstart-cmd "sleep infinity" \
 --ssh --direct

# to remove stale/expired contracts from your machine:
vastai cleanup machine 142067

# If that doesn't work you can also try:
vastai delete machine 142067
