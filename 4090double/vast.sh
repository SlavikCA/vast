vastai show machine 154319


vastai self-test machine 154319
# --ignore-requirements

Machine: 154319 Done with testing remote.py results DONE
Test completed successfully.

# --price_gpu:  per gpu rental price in $/hour
vastai list machine 154319 --price_gpu 0.39 --discount_rate 0.35 --price_min_bid 0.33 --price_disk 0.20 --price_inetu 0.009 --price_inetd 0.006 --vol_size 1200 --vol_price 0.20  --duration 1month
vastai list machine 154319 --price_gpu 0.44 --discount_rate 0.42 --price_min_bid 0.42 --price_disk 0.20 --price_inetu 0.009 --price_inetd 0.006 --vol_size 1200 --vol_price 0.20  --duration 1month
vastai list machine 154319 --price_gpu 0.49 --discount_rate 0.39 --price_min_bid 0.39 --price_disk 0.20 --price_inetu 0.009 --price_inetd 0.006 --vol_size 1200 --vol_price 0.20  --duration 2weeks
--end_date 1784721600
vastai unlist machine 154319

# to remove stale/expired contracts from your machine:
vastai cleanup machine 154319
# If that doesn't work you can also try:
vastai delete machine ????

# https://docs.vast.ai/host/cli/schedule-maint
date +%s
vastai schedule maint 154319 --sdate 1791406700 --duration 2 --maintenance_category power
vastai show maints -i 154319
vastai cancel maint 154319

## OFFERS

vastai search offers "machine_id=154319 verified=any rentable=any"
    #  ID        CUDA   N  Model     PCIE  cpu_ghz  vCPUs    RAM  VRAM  Disk  $/hr    DLP    DLP/$   score  NV Driver  Net_up  Net_down  R     Max_Days  mach_id  status      host_id  ports  country           
  1  56340715  13.4  2x  RTX_4090  23.8  3.2      20.0   193.2  49.1  2329  1.0419  243.5  233.75  72.0   615.71.09  1472.7  2405.5    64.4  30.0      154319   unverified  598643   99     South_Carolina,_US
  2  56340716  13.4  1x  RTX_4090  23.8  3.2      10.0    96.6  49.1  1165  0.5219  123.7  237.07  68.6   615.71.09  1472.7  2405.5    64.4  30.0      154319   unverified  598643   49     South_Carolina,_US

vastai create instance 56340715 \
 --image nvidia/cuda:13.3.0-devel-ubuntu24.04 \
 --ssh --direct


slavik@vast4090double:~$ nvidia-smi
Sat Oct 24 19:03:42 2026
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 615.71.10              KMD Version: 615.71.10     CUDA UMD Version: 13.4     |
+-----------------------------------------+------------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  NVIDIA GeForce RTX 4090        On  |   00000000:01:00.0 Off |                  Off |
| 32%   34C    P8             16W /  225W |       1MiB /  49140MiB |      0%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+
|   1  NVIDIA GeForce RTX 4090        On  |   00000000:02:00.0 Off |                  Off |
| 33%   32C    P8             17W /  450W |       1MiB /  49140MiB |      0%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+

slavik@vast4090double:~$ uname -r
6.8.0-147-generic
