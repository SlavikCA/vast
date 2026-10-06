# Vast

https://github.com/SlavikCA/vast.git

[Vast dashboard](https://cloud.vast.ai/host/machines/)

[HashRate stats](https://hashrate.no/platforms/vast/hosts/598643)

[Host monitoring](https://mon.acloud.app/system/jke7slbs8bhbzfx)

[HostLens](https://hostlens.app/dashboard)

https://itnext.io/host-setup-for-qemu-kvm-gpu-passthrough-with-vfio-on-linux-c65bacf2d96b

Why I'm using llama.cpp directly and not ran by Vast:
- port randomized on every run
- hassle managing volume (size, ID, variables)
- hard to figure out parameters
- limited versions available on Vast template

Vast instances can use at most 64? 256? open ports each

#### configure Vast API

```bash
sudo apt install pipx
pipx install vastai
vastai set api-key ??
```

Alternative:
- https://provider.lium.io/

Current realistic price (rented P50 .. P90):
- https://hashrate.no/hostings/5090/Vast/   $0.40 - $0.65
- https://hashrate.no/hostings/5080/Vast/   $0.18 - $0.25
- https://hashrate.no/hostings/5070ti/Vast/ $0.15 - $0.25
- https://hashrate.no/hostings/5070/Vast/   $0.12 - $0.16
- https://hashrate.no/hostings/5060ti/Vast/ $0.11 - $0.17
- https://hashrate.no/hostings/5060/Vast/   $0.07 - $0.16
- https://hashrate.no/platforms/vast/gpus
