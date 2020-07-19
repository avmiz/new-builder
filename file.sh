#!/usr/bin/env bash
. main.sh
git clone https://github.com/MiCode/Xiaomi_Kernel_OpenSource -b begonia-p-oss
cd Xiaomi_Kernel_OpenSource
git fetch origin begonia-q-oss
git checkout origin/begonia-q-oss && git checkout -b begonia-q-oss
git remote add private https://$githubKey@github.com/ZyCromerZ/begonia_stock.git
git push --all private -f
cd ..
rm -rf Xiaomi_Kernel_OpenSource