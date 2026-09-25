sudo mkdir -p /var/lib/docker/.cache/huggingface/hub
curl -LsSf https://hf.co/cli/install.sh | bash

# https://huggingface.co/unsloth/medgemma-27b-it-GGUF
sudo /home/slavik/.local/bin/hf download --cache-dir /var/lib/docker/.cache/huggingface/hub  unsloth/medgemma-27b-it-GGUF --include *UD-Q8_K_XL.gguf --include *-F16.gguf 

D_OPTIONS="-d --rm --device=nvidia.com/gpu=all \
 -e NVIDIA_VISIBLE_DEVICES=all \
 -e NVIDIA_DRIVER_CAPABILITIES=compute,utility \
 -v /var/lib/docker/.cache/huggingface/hub:/root/.cache/huggingface/hub \
 -p 8080:8080"

IMAGE="ghcr.io/ggml-org/llama.cpp:server-cuda13-b11176"

LLM="--host 0.0.0.0  --port 8080  --api-key fursov \
   --fit off --gpu-layers all --gpu-layers-draft all \
   --top-p 0.95 --top-k 20 --temp 1.0 --min-p 0.00 --repeat-penalty 1.0 \
   --spec-type draft-mtp"

# https://huggingface.co/unsloth/Qwen3.8-27B-GGUF
sudo docker run --name llama $D_OPTIONS $IMAGE $LLM \
   -hf unsloth/Qwen3.8-27B-GGUF:UD-Q8_K_XL \
   --ctx-size 260000

# https://huggingface.co/unsloth/Qwen3.8-Flash-Next-GGUF
sudo docker run --name llama $D_OPTIONS $IMAGE $LLM \
   -hf unsloth/Qwen3.8-Flash-Next-GGUF:UD-Q5_K_XL \
   --ctx-size 32768

# https://huggingface.co/bartowski/orcarouter_Qwen3.8-27B-Uncensored-GGUF
sudo docker run --name llama $D_OPTIONS $IMAGE $LLM \
   -hf bartowski/orcarouter_Qwen3.8-27B-Uncensored-GGUF:Q5_K_M \
   --ctx-size 100000

sudo docker logs -f llama

sudo docker stop llama
