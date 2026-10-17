vastai show machine 154319


vastai self-test machine 154319
# --ignore-requirements

Machine: 154319 Done with testing remote.py results DONE
Test completed successfully.

# --price_gpu:  per gpu rental price in $/hour
vastai list machine 154319 --price_gpu 0.49 --discount_rate 0.48 --price_min_bid 0.39 --price_disk 0.20 --price_inetu 0.009 --price_inetd 0.006 --vol_size 1200 --vol_price 0.20  --duration 1month
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
  #  ID        CUDA   N  Model     PCIE  cpu_ghz  vCPUs    RAM  VRAM  Disk  $/hr    DLP  DLP/$  score  NV Driver  Net_up  Net_down  R     Max_Days  mach_id  status      host_id  ports  country           
  1  56340716  13.4  1x  RTX_4090  23.9  -        10.0    96.6  49.1  1165  0.6552  0.7  1.03   0.3    615.71.09  1472.7  2405.5    61.6  30.0      154319   unverified  598643   49     South_Carolina,_US
  2  56340715  13.4  2x  RTX_4090  23.8  -        20.0   193.2  49.1  2329  1.3085  1.1  0.84   0.2    615.71.09  1472.7  2405.5    61.6  30.0      154319   unverified  598643   99     South_Carolina,_US

  