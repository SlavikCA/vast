curl -LsSf https://hf.co/cli/install.sh | bash

# --dry-run

# https://huggingface.co/unsloth/medgemma-27b-it-GGUF
sudo /home/slavik/.local/bin/hf download --cache-dir /var/lib/docker/.cache  unsloth/medgemma-27b-it-GGUF --include *UD-Q8_K_XL.gguf --include *-F16.gguf 
