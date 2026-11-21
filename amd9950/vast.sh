## AMD9950
vastai show machine 147987
  #  ID      #gpus  gpu_name  disk  hostname  driver     reliab  veri      ip              geoloc              reports  gpuD_$/h  gpuI$/h  rdisc  netu_$/TB  netd_$/TB  occup
  1  147987  1      RTX_5090  1168  amd9950   620.70.06  0.9938  verified  104.63.172.143  South_Carolina,_US  -        0.64      0.49     0.20   5.12       5.12       x_   

vastai self-test machine 147987
# --ignore-requirements
Machine: 147987 Done with testing remote.py results DONE
Test completed successfully.

vastai list machine 147987 --discount_rate 0.2 --price_gpu 0.64 --price_min_bid 0.49 --price_disk 0.20 --price_inetu 0.005 --price_inetd 0.005 --vol_size 1100 --vol_price 0.20  --duration 6month
vastai list machine 147987 --discount_rate 0.2 --price_gpu 0.99 --price_min_bid 0.69 --price_disk 0.20 --price_inetu 0.005 --price_inetd 0.005 --vol_size 1100 --vol_price 0.20  --duration 3month

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

vastai search offers "machine_id=147987 verified=any rentable=any"
  #  ID        CUDA   N  Model     arch   PCIE  cpu_ghz  vCPUs   RAM  VRAM  Disk  $/hr    DLP    DLP/$   score  NV Driver  Net_up  Net_down  R     Max_Days  mach_id  status    host_id  ports  country           
  1  61844170  13.5  1x  RTX_5090  amd64  45.4  5.8      32.0   61.9  32.6  1168  0.8552  140.2  163.96  180.0  620.70.06  3017.4  1522.9    99.4  180.0     147987   verified  598643   99     South_Carolina,_US

## VOLUMES   https://docs.vast.ai/guides/instances/storage/volumes


vastai create instance 61844170 \
 --image nvidia/cuda:13.3.0-devel-ubuntu24.04 \
 --ssh --direct


slavik@amd9950:~$ nvidia-smi
Sat Nov 21 13:51:19 2026       
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 620.70.06              KMD Version: 620.70.06     CUDA UMD Version: 13.5     |
+-----------------------------------------+------------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  NVIDIA GeForce RTX 5090        On  |   00000000:01:00.0 Off |                  N/A |
|  0%   31C    P8             21W /  400W |       2MiB /  32607MiB |      0%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+

slavik@amd9950:~$ uname -r
7.0.0-43-generic
