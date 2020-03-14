#!/usr/bin/env bash
function sendToTele(){
    echo  "send To tele"
    ZIP="$1"
    if [ "$3" != "" ];then
        RefreshRT="$3(oc)"
    else
        RefreshRT="60Hz(default)"
    fi
    curl -F document=@$ZIP "https://api.telegram.org/bot$token/sendDocument" \
        -F chat_id="$chat_id" \
        -F "disable_web_page_preview=true" \
        -F "parse_mode=html" \
        -F caption="New kernel !!
Build took $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) second(s).

- Kernel name : $2
- Refreshrate : $RefreshRT
 
Using compiler: 
- <code>$(${gccFolder}gcc --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g')</code>
- <code>$(${clangFolder} --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g')</code>" >/dev/null
}
function sendToSf(){
    echo "upload to sf"
    Zip_File="$(pwd)/$1"
    rsync -avP -e "ssh -o StrictHostKeyChecking=no" "$Zip_File" $my_host@frs.sourceforge.net:/home/frs/project/zyc-kernel/$FolderUpload/ >/dev/null
}
function makeZip(){
    KERNEL_NAME=$(cat "$(pwd)/arch/arm64/configs/X01BD_defconfig" | grep "CONFIG_LOCALVERSION=" | sed 's/CONFIG_LOCALVERSION="-*//g' | sed 's/"*//g' )
    ZIP_KERNEL_VERSION="4.4.$(cat "$(pwd)/Makefile" | grep "SUBLEVEL =" | sed 's/SUBLEVEL = *//g')"
    cd AnyKernel || exit 1
    if [ ! -d "spectrum" ];then
        git clone https://$githubKey@github.com/ZyCromerZ/spectrum.git spectrum
    fi
    if [ -e "spectrum/$spectrumFile" ];then
        cp -af "spectrum/$spectrumFile" init.spectrum.rc
    else
        if [ -e "init.spectrum.rc" ];then
            rm -rf init.spectrum.rc
        fi
    fi
    Type=""
    HzNya=""
    if [ ! -z "$1" ];then
        Type=$1
        HzNya=${Type/"P"/""}
        HzNya=${HzNya/"Q"/""}
    fi
    cp -af anykernel-real.sh anykernel.sh
    sed -i "s/kernel.string=.*/kernel.string=$KERNEL_NAME-$GetCommit by ZyCromerZ/g" anykernel.sh
    ZipName="$Type[$TANGGAL]$ZIP_KERNEL_VERSION-$KERNEL_NAME-$GetCommit.zip"
    zip -r $ZipName ./ -x /.git/* ./anykernel-real.sh ./.gitignore ./LICENSE ./README.md ./spectrum/* ./*.zip  >/dev/null 2>&1
    if [ ! -z "$2" ] && [ "$2" == "tele" ];then
        sendToTele "$ZipName" "$KERNEL_NAME" "$HzNya"
    else
        sendToSf "$ZipName"
    fi
    rm -rf "$ZipName"
    cd ..

}
function finerr() {
    curl -s -X POST "https://api.telegram.org/bot$token/sendMessage" \
        -d chat_id="$chat_id" \
        -d "disable_web_page_preview=true" \
        -d "parse_mode=html" \
        -d text="Build kernel from branch : $branch failed -_-" >/dev/null
    exit 1
}
function build(){
    if [ ! -z "$3" ];then
        chat_id="$3"
    fi
    if [ ! -z "$1" ];then
        if [[ "$1" == *"65Hz"* ]];then
            git reset --hard $HeadCommit
            git cherry-pick 19d101e1867d9258e891ce268d4a2ed4060503bf
        fi
        if [[ "$1" == *"66Hz"* ]];then
            git reset --hard $HeadCommit
            git cherry-pick d650ba4f383f6ed95eed1d490997017108a49658
        fi
        if [[ "$1" == *"67Hz"* ]];then
            git reset --hard $HeadCommit
            git cherry-pick f7978179ccab8ede11e6bf43d1c78ec9817d29f9
        fi
        if [[ "$1" == *"68Hz"* ]];then
            git reset --hard $HeadCommit
            git cherry-pick f454705ba8de74cbdffd9c3282d606fef9f5aec2
        fi
        if [[ "$1" == *"69Hz"* ]];then
            git reset --hard $HeadCommit
            git cherry-pick d2a0997f1a5ec02a91dcab14014f32ca6ed2daec
        fi
        if [[ "$1" == *"71Hz"* ]];then
            git reset --hard $HeadCommit
            git cherry-pick 62dd986b087c9a1f1b2eca5174db071a99dc11fb
        fi
    fi;
    GetCommit=$(git log --pretty=format:'%h' -1)
    GetCore=$(nproc --all)
    START=$(date +"%s")
    make -j$(($GetCore+1))  O=out ARCH=arm64 X01BD_defconfig
    make -j$(($GetCore+1))  O=out \
                            ARCH=arm64 \
                            CROSS_COMPILE=$gccFolder \
                            CC=$clangFolder \
                            CLANG_TRIPLE=aarch64-linux-gnu-

    if ! [ -a "$IMAGE" ]; then
        finerr
        exit 1
    fi
    cp -af out/arch/arm64/boot/Image.gz-dtb AnyKernel
    END=$(date +"%s")
    DIFF=$(($END - $START))
    makeZip "$1" "$2"
}
if [ ! -z "$1" ] && [ "$1" == "get-kernel" ];then
    git clone https://$githubKey@github.com/ZyCromerZ/X01BD_Kernel.git -b $branch $folder
    cd $folder
    git fetch origin rebase-20200313-rename
    git clone --depth=1 https://github.com/Haseo97/Clang-11.0.0.git -b 11.0.0 Getclang
    git clone --depth=1 https://github.com/baalajimaestro/aarch64-maestro-linux-android.git -b 07032020-9.2.1 GetGcc
    git clone --depth=1 https://github.com/ZyCromerZ/AnyKernel3 AnyKernel
    export ARCH="arm64"
    export KBUILD_BUILD_USER="ZyCromerZ"
    export KBUILD_BUILD_HOST="circleCi-server"
    clangFolder="$(pwd)/Getclang/bin/clang"
    gccFolder="$(pwd)/GetGcc/bin/aarch64-maestro-linux-gnu-"
    IMAGE="$(pwd)/out/arch/arm64/boot/Image.gz-dtb"
    TANGGAL=$(date +"%m%d")
fi
echo "include main.sh success"
## info builder
# build A B C
# A = type,none = 60Hz
# B = send to 
# C = chat_id telegram