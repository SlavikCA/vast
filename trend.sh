export VAST_API_KEY="???"

# for GPU in "RTX 4090" "RTX 5090"; do
for GPU in "RTX 5090"; do
  SAFE=$(echo "$GPU" | tr ' ' '_')

  curl -sG "https://console.vast.ai/api/v0/metrics/gpu/history/" \
    -H "Authorization: Bearer $VAST_API_KEY" \
    --data-urlencode "gpu_name=$GPU" \
    --data-urlencode "verified=yes" \
    --data-urlencode "start=$(($(date -u +%s) - 14400))" \
    --data-urlencode "end=$(date -u +%s)" \
    --data-urlencode "step=3600" | jq \
    > "${SAFE}_vast_gpu_hist.json"
done
