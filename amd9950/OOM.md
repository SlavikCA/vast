Short answer

The host hard-locked at ~07:03:15 EDT Oct 18 (last userspace write 07:03:14.175, next boot 08:32:40). No kernel crash was recorded.

The only failure precursor visible in the logs is severe host-memory exhaustion: the machine climbed from ~5.7 GiB used to 56.3 GiB of 60.4 GiB (93%), with only     
0.96 GiB free, page cache squeezed from 29 GiB to 1.9 GiB, and swap churn for 4.5 hours. Growth begins right after a Vast.ai rental container was created/started at
02:24.

That strongly points to a memory-reclaim/OOM hard lockup. However, the kernel logged no OOM kill, hung-task warning, panic, Xid, MCE, AER, or thermal event, so a    
hardware-level power/VRM/PSU event cannot be excluded from the logs alone. A software panic is unlikely: pstore is empty, kdump is inactive, and the box did not     
reboot until you reset it.

Memory evidence (sar -f /var/log/sysstat/sa18 -r -S)

┌──────────┬──────────┬──────────┬──────────┬───────────┐                                                                                                            
│ Time EDT │ Free     │ Used     │ Cached   │ Swap used │                                                                                                            
├──────────┼──────────┼──────────┼──────────┼───────────┤                                                                                                            
│ 00:30    │ 37.6 GiB │ 5.7 GiB  │ 14.8 GiB │ 0.4 GiB   │                                                                                                            
├──────────┼──────────┼──────────┼──────────┼───────────┤                                                                                                            
│ 02:20    │ 23.6 GiB │ 5.8 GiB  │ 28.6 GiB │ 0.4 GiB   │                                                                                                            
├──────────┼──────────┼──────────┼──────────┼───────────┤                                                                                                            
│ 02:30    │ 19.1 GiB │ 9.8 GiB  │ 29.0 GiB │ 0.4 GiB   │                                                                                                            
├──────────┼──────────┼──────────┼──────────┼───────────┤                                                                                                            
│ 03:00    │ 1.0 GiB  │ 25.0 GiB │ 32.9 GiB │ 4.0 GiB   │                                                                                                            
├──────────┼──────────┼──────────┼──────────┼───────────┤                                                                                                            
│ 04:00    │ 1.7 GiB  │ 38.5 GiB │ 18.9 GiB │ 4.1 GiB   │                                                                                                            
├──────────┼──────────┼──────────┼──────────┼───────────┤                                                                                                            
│ 05:00    │ 1.6 GiB  │ 42.3 GiB │ 15.1 GiB │ 4.1 GiB   │                                                                                                            
├──────────┼──────────┼──────────┼──────────┼───────────┤                                                                                                            
│ 06:00    │ 1.8 GiB  │ 48.9 GiB │ 8.3 GiB  │ 3.9 GiB   │                                                                                                            
├──────────┼──────────┼──────────┼──────────┼───────────┤                                                                                                            
│ 07:00    │ 0.96 GiB │ 56.3 GiB │ 1.87 GiB │ 4.14 GiB  │                                                                                                            
└──────────┴──────────┴──────────┴──────────┴───────────┘

Swap activity was already ~1,300 pages/s in and out at 07:00; the last 10-minute interval added +5.8 GiB of used memory.

What was running

- Vast.ai container C.56510268 was created 02:24:19 and started 02:24:20 — six minutes before the first big memory jump.
- The agent’s stats for it were pinned at 14.041 GB used / 14.062 GB limit.
- Another stopped Vast.ai container on the same host, C.56420905, has Memory=62,321,065,984 (~58 GiB) and ShmSize=32,212,254,720 (~30 GiB) — on a host with only     
  60.4 GiB total RAM. No host-level memory guard exists (vm.overcommit_memory=0).
- The GPU was idle: 19 W, 29 °C, no processes; the display AMD iGPU showed no reset/error. nvidia-smi calls were succeeding at 07:02.

What the logs do not show

- No Out of memory: Killed process, no oom-kill.
- No hung_task warning (threshold is 120 s; the host was down for 89 min).
- No NMI watchdog / hard-lockup / soft-lockup message (nmi_watchdog=1).
- No Xid/NVRM, MCE, PCIe AER, or thermal trip.
- No clean shutdown sequence, no crash dump, no automatic reboot.
- Last signs of life: syslog/journal end at 07:03:01–07:03:02; kaalia.log still writes a docker container ls at 07:03:14.175, then nothing.

Conclusion

Most likely: host memory exhaustion caused a hard lockup. The final acceleration to 0.96 GiB free, cache full reclaim, and swap churn occurred minutes before the
   freeze, and the growth began with the 02:24 Vast.ai container. The absence of an OOM trace means the kernel stopped before it could report — consistent with a    
   reclaim/allocator deadlock or a pinned/unreclaimable allocation.         
