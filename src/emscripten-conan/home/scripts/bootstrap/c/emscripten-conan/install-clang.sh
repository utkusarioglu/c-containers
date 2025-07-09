#!/bin/bash

set -euo pipefail
bash --version

# 1. Download and install llvm.sh (adds repo + installs Clang)
wget -qO- https://apt.llvm.org/llvm.sh | sudo bash -s -- 20

# 2. (Optional) Move GPG key to Debian keyrings if you want future security compliance:
mkdir -p /etc/apt/keyrings
mv /etc/apt/trusted.gpg.d/apt.llvm.org.asc /etc/apt/keyrings/

# 3. Update package lists and install full toolchain
apt update
apt install -y \
  clang-20 \
  lldb-20 \
  lld-20 \
  clang-tools-20 \
  clangd-20 \
  clang-tidy-20 \
  llvm-20

ln -s /usr/bin/clang-20 /usr/local/bin/clang
ln -s /usr/bin/clang++-20 /usr/local/bin/clang++
#
# 4. Verify
clang --version
