#!/bin/bash

set -e

git clone https://github.com/fastfetch-cli/fastfetch
apt install git
git clone https://github.com/fastfetch-cli/fastfetch
cd fastfetch; mkdir -p build; cd build; cmake ..; cmake --build . --target fastfetch --target flashfetch
