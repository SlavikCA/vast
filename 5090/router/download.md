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

sudo /home/slavik/.local/bin/hf download --cache-dir /var/lib/docker/.cache/huggingface/hub  huihui-ai/Huihui-DeepSeek-V4-Flash-abliterated-GGUF --include *Q3_K_S.gguf

[Laguna-S-2.1-GGUF:Q4_K_M]
#  https://huggingface.co/poolside/Laguna-S-2.1-GGUF
sudo /home/slavik/.local/bin/hf download --cache-dir /var/lib/docker/.cache/huggingface/hub poolside/Laguna-S-2.1-GGUF --include *Q4_K_M.gguf --include=laguna-s-2.1-DFlash-BF16.gguf
sudo /home/slavik/.local/bin/hf download --cache-dir /var/lib/docker/.cache/huggingface/hub unsloth/Laguna-S-2.1-GGUF  --include "UD-Q4_K_XL/*"

[unsloth/DeepSeek-V4-Flash-0731:Q8_K_XL]
sudo /home/slavik/.local/bin/hf download --cache-dir /var/lib/docker/.cache/huggingface/hub unsloth/DeepSeek-V4-Flash-0731-GGUF --include "UD-Q8_K_XL/*"
# 160 GB

https://huggingface.co/unsloth/DeepSeek-V4-Flash-0731-GGUF/tree/main/UD-Q3_K_XL
# 130 GB