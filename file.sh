#!/usr/bin/env bash
. main.sh
mkdir p-memeui
mkdir q-memeui
RootPath=$(pwd)
git clone https://github.com/MiCode/Xiaomi_Kernel_OpenSource -b begonia-p-oss
cd Xiaomi_Kernel_OpenSource
cp -af ./* $RootPath/p-memeui
rm -rf $RootPath/p-memeui/.git
git fetch origin begonia-q-oss
git checkout origin/begonia-q-oss
cp -af ./* $RootPath/q-memeui
rm -rf $RootPath/q-memeui/.git
cd ..
rm -rf Xiaomi_Kernel_OpenSource
git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git -b v4.14.141
cd linux
git remote add private https://$githubKey@github.com/ZyCromerZ/begonia_stock.git
KernelPath=$(pwd)
git fetch origin v4.14.94 && git checkout FETCH_HEAD && git checkout -b begonia-p-oss-root
cp -af $RootPath/p-memeui/* ./
git add . && git commit -s -m 'treewide: copy files from begonia-p-oss'
git fetch origin v4.14.141 && git checkout FETCH_HEAD && git checkout -b begonia-q-oss-root
cp -af $RootPath/q-memeui/* ./
git add . && git commit -s -m 'treewide: copy files from begonia-q-oss'
git push --all private -f
cd ..
rm -rf ./linux ./p-memeui ./q-memeui