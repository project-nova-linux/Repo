#!/bin/bash

set -e

git clone https://github.com/fastfetch-cli/fastfetch BuildFastFetch
sudo apt install git build-essential pkg-config libx11-dev libxft-dev cmake
git clone https://github.com/fastfetch-cli/fastfetch
cd BuildFastFetch; mkdir -p build; cd build; cmake ..; cmake --build . --target fastfetch --target flashfetch
