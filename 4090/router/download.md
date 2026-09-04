sudo mkdir -p /var/lib/docker/.cache/huggingface/hub
curl -LsSf https://hf.co/cli/install.sh | bash

# --dry-run

# https://huggingface.co/unsloth/medgemma-27b-it-GGUF
sudo /home/slavik/.local/bin/hf download --cache-dir /var/lib/docker/.cache/huggingface/hub  unsloth/medgemma-27b-it-GGUF --include *UD-Q8_K_XL.gguf --include *-F16.gguf 

# https://huggingface.co/unsloth/Qwen3.8-27B-GGUF
sudo docker run -d --rm --name llama \
 --device=nvidia.com/gpu=all \
 -e NVIDIA_VISIBLE_DEVICES=all \
 -e NVIDIA_DRIVER_CAPABILITIES=compute,utility \
 -v /var/lib/docker/.cache/huggingface/hub:/root/.cache/huggingface/hub \
 -p 8080:8080 \
 ghcr.io/ggml-org/llama.cpp:server-cuda13-b10795 \
   -hf unsloth/Qwen3.8-27B-GGUF:UD-Q8_K_XL \
   --host 0.0.0.0  --port 8080  --api-key fursov \
   --fit off --gpu-layers all --gpu-layers-draft all \
   --top-p 0.95 --top-k 20 --temp 1.0 --min-p 0.00 --repeat-penalty 1.0 \
   --spec-type draft-mtp \
   --ctx-size 260000

sudo docker logs -f llama

# https://huggingface.co/unsloth/Qwen3.8-Flash-Next-GGUF
sudo docker run -d --rm --name llama \
 --device=nvidia.com/gpu=all \
 -e NVIDIA_VISIBLE_DEVICES=all \
 -e NVIDIA_DRIVER_CAPABILITIES=compute,utility \
 -v /var/lib/docker/.cache/huggingface/hub:/root/.cache/huggingface/hub \
 -p 8080:8080 \
 ghcr.io/ggml-org/llama.cpp:server-cuda13-b10795 \
   -hf unsloth/Qwen3.8-Flash-Next-GGUF:UD-Q5_K_XL \
   --host 0.0.0.0  --port 8080  --api-key fursov \
   --fit off --gpu-layers all --gpu-layers-draft all \
   --top-p 0.95 --top-k 20 --temp 1.0 --min-p 0.00 --repeat-penalty 1.0 \
   --spec-type draft-mtp \
   --ctx-size 32768
