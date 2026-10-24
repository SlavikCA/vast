#!/bin/bash
# sudo nano /usr/local/bin/limiter.sh
# Miner GPU Power Monitor
# Watches for miner process and adjusts GPU power limit accordingly.

MINER_PATTERN="miner"      # process name to watch
POWER_MINER=225                  # watts when miner is running
POWER_DEFAULT=425                # watts when idle
GPU_INDEX=0
CHECK_INTERVAL=15                # seconds between checks
LOG="/var/log/limiter.log"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') $*" | tee -a "$LOG"
}

set_power() {
    local watts=$1
    nvidia-smi -i $GPU_INDEX -pl "$watts" >> "$LOG" 2>&1
}

# Track current state to avoid spamming nvidia-smi
current_state=""

log "=== Limiter power monitor started ==="
log "Miner pattern: '$MINER_PATTERN' | Miner limit: ${POWER_MINER}W | Default: ${POWER_DEFAULT}W"

while true; do
    if pgrep -f "$MINER_PATTERN" > /dev/null 2>&1; then
        if [[ "$current_state" != "miner" ]]; then
            log "Miner detected — setting GPU $GPU_INDEX power limit to ${POWER_MINER}W"
            set_power $POWER_MINER
            current_state="miner"
        fi
    else
        if [[ "$current_state" != "idle" ]]; then
            log "Miner not running — restoring GPU $GPU_INDEX power limit to ${POWER_DEFAULT}W"
            set_power $POWER_DEFAULT
            current_state="idle"
        fi
    fi
    sleep $CHECK_INTERVAL
done

# sudo chmod +x /usr/local/bin/limiter.sh
# sudo tail -f /var/log/limiter.log
