sudo mkdir -p /var/lib/docker/.cache/huggingface/hub
curl -LsSf https://hf.co/cli/install.sh | bash

# --dry-run

# https://huggingface.co/unsloth/medgemma-27b-it-GGUF
sudo /home/slavik/.local/bin/hf download --cache-dir /var/lib/docker/.cache/huggingface/hub  unsloth/medgemma-27b-it-GGUF --include *UD-Q8_K_XL.gguf --include *-BF16.gguf
sudo rsync -av /mnt/models/.cache/huggingface/hub/models--unsloth--medgemma-27b-it-GGUF /var/lib/docker/.cache/huggingface/hub/

# https://huggingface.co/unsloth/Qwen3.6-27B-MTP-GGUF
[unsloth/Qwen3.6-27B-MTP-GGUF:Q5_K_XL]

# https://huggingface.co/unsloth/GLM-5.2-GGUF
# 320G
[unsloth/GLM-5.2-GGUF:Q3_K_XL]
sudo rsync -av /mnt/models/.cache/huggingface/hub/models--unsloth--GLM-5.2-GGUF /var/lib/docker/.cache/huggingface/hub/

sudo /home/slavik/.local/bin/hf download --cache-dir /var/lib/docker/.cache/huggingface/hub  huihui-ai/Huihui-DeepSeek-V4-Flash-abliterated-GGUF --include *Q3_K_S
