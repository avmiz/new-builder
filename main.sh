#!/usr/bin/env bash
function sendInfo(){
    curl -s -X POST "https://api.telegram.org/bot$token/sendMessage" \
        -d chat_id="$chat_id" \
        -d "disable_web_page_preview=true" \
        -d "parse_mode=html" \
        -d text="$1" >/dev/null
}
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
    createLink=$1
    createLink=${createLink/"["/"%5B"}
    createLink=${createLink/"]"/"%5D"}
    if [ "$3" != "" ];then
        if [[ "$1" == *"60Hz"* ]];then
            RefreshRT="60Hz(default)"
        else
            RefreshRT="$3(oc)"
        fi
    else
        RefreshRT="60Hz(default)"
    fi
    Text="New kernel !!
Build took $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) second(s).

- Kernel name : $2
- Refreshrate : $RefreshRT
 
Using compiler: 
- <code>$(${gccFolder}gcc --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g')</code>
- <code>$(${clangFolder} --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g')</code>

Link Download : <a href='https://sourceforge.net/projects/zyc-kernel/files/$FolderUpload/$createLink/download'>link download $1 ready!!! </a>"
    sendInfo "$Text"
}
function makeZip(){
    KERNEL_NAME=$(cat "$(pwd)/arch/arm64/configs/X01BD_defconfig" | grep "CONFIG_LOCALVERSION=" | sed 's/CONFIG_LOCALVERSION="-*//g' | sed 's/"*//g' )
    ZIP_KERNEL_VERSION="4.4.$(cat "$(pwd)/Makefile" | grep "SUBLEVEL =" | sed 's/SUBLEVEL = *//g')$(cat "$(pwd)/Makefile" | grep "EXTRAVERSION =" | sed 's/EXTRAVERSION = *//g')"
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
        HzNya=${HzNya/"QSAR"/""}
        HzNya=${HzNya/"Q"/""}
        HzNya=${HzNya/"DTC"/""}
        HzNya=${HzNya/"Avalon"/""}
    fi
    cp -af anykernel-real.sh anykernel.sh
    sed -i "s/kernel.string=.*/kernel.string=$KERNEL_NAME-$HeadCommit by ZyCromerZ/g" anykernel.sh
    ZipName="$Type[$TANGGAL]$ZIP_KERNEL_VERSION-$KERNEL_NAME-$HeadCommit.zip"
    zip -r $ZipName ./ -x /.git/* ./anykernel-real.sh ./.gitignore ./LICENSE ./README.md ./spectrum/* ./*.zip  >/dev/null 2>&1
    if [ ! -z "$2" ] && [ "$2" == "tele" ];then
        sendToTele "$ZipName" "$KERNEL_NAME" "$HzNya"
    else
        sendToSf "$ZipName" "$KERNEL_NAME" "$HzNya"
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
function clean_build() {
    make -j$(($GetCore+1)) O=out clean mrproper >/dev/null
    make -j$(($GetCore+1)) clean mrproper >/dev/null
    git checkout origin/$branch && git branch -D $branch >/dev/null
}
function change_branch() {
    git fetch origin $branch && git checkout origin/$branch  && git checkout -b $branch >/dev/null
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
    git pull . origin/rebase-20200313-$TAGKENEL --no-commit
    git commit -s -m "upstream kernel to $TAGKENEL tags"
    GetKernelName="$(cat "./arch/arm64/configs/X01BD_defconfig" | grep "CONFIG_LOCALVERSION=" | sed 's/"//g' | sed 's/CONFIG_LOCALVERSION=//g')"
    sed -i "s/CONFIG_LOCALVERSION=.*/CONFIG_LOCALVERSION="'"'$GetKernelName'-'$TAGKENEL'"'"/g" "./arch/arm64/configs/X01BD_defconfig"
    git add ./arch/arm64/configs/X01BD_defconfig && git commit -s -m "CONFIG_LOCALVERSION=$GetKernelName-$TAGKENEL"
    if [ ! -z "$($clangFolder --version | head -n 1 | grep DragonTC)" ];then
        ## revert some fix for gcc 9.x changes for DragonTC clang 10
        git revert 16de298c372d55c943369ae36a0ad762e1727de1 --no-commit
        git commit -s -m "Revert: 16de298c372d55c943369ae36a0ad762e1727de1"
        ## revert Makefile changes for DragonTC clang 10
        git cherry-pick 061921ff48ab53ace6cf0214298fe07b5153891e
        ## git cherry-pick 590be66545f2f695de4e3465cca483cc4aa0958b
        git cherry-pick cdb9514c11cc6b8acb9eccdb960d6c934a981b1c
    fi
    if [[ "$1" == *"Avalon"* ]];then
        [ ! -d "GetGcc" ] && Getclang "avalon"
        [ ! -d "Getclang" ] && Getclang "avalon"
        SetClang "avalon"
    elif [[ "$1" == *"DTC"* ]];then
        [ ! -d "GetGcc" ] && Getclang "dtc"
        [ ! -d "Getclang" ] && Getclang "dtc"
        SetClang "dtc"
    else
        [ ! -d "GetGcc" ] && Getclang "avalon"
        [ ! -d "Getclang" ] && Getclang "avalon"
        SetClang "avalon"
    fi
    TANGGAL=$(date +"%m%d")
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
function Getclang(){
    [ ! -d "Getclang" ] && mkdir Getclang
    cd Getclang
    git init
    if [ "$1" == "dtc" ];then
        git remote add dtc https://github.com/Bikram557/DragonTC-10.0.git
        git fetch dtc dragontc --depth=1
    elif [ "$1" == "avalon" ];then
        git remote add avalon https://github.com/Haseo97/Avalon-Clang-11.0.1.git
        git fetch avalon 11.0.1 --depth=1
    else
        git remote add avalon https://github.com/Haseo97/Avalon-Clang-11.0.1.git
        git fetch avalon 11.0.1 --depth=1
        git remote add dtc https://github.com/Bikram557/DragonTC-10.0.git
        git fetch dtc dragontc --depth=1
    fi
    cd ..
    [ ! -d "GetGcc" ] && mkdir GetGcc
    cd GetGcc
    git init
    if [ "$1" == "dtc" ];then
        git remote add gcc-9-old https://github.com/najahiiii/aarch64-linux-gnu.git
        git fetch gcc-9-old gcc9-20190401 --depth=1
    elif [ "$1" == "Avalon" ];then
        git remote add gcc-9-latest https://github.com/arter97/arm64-gcc.git
        git fetch gcc-9-latest master --depth=1
    else
        git remote add gcc-9-latest https://github.com/milouk/gcc-prebuilt-elf-toolchains.git
        git fetch gcc-9-latest master --depth=1
        git remote add gcc-9-old https://github.com/najahiiii/aarch64-linux-gnu.git
        git fetch gcc-9-old gcc9-20190401 --depth=1
    fi
    cd ..
}
function SetClang(){
    if [ "$1" == "avalon" ];then
        cd Getclang
        git checkout avalon/11.0.1
        cd ..
        cd GetGcc
        git checkout gcc-9-latest/master
        cd ..
        clangFolder="$(pwd)/Getclang/bin/clang"
        gccFolder="$(pwd)/GetGcc/aarch64-linux-elf/bin/aarch64-linux-elf-"
    elif [ "$1" == "dtc" ];then
        cd Getclang
        git checkout dtc/dragontc
        cd ..
        cd GetGcc
        git checkout gcc-9-old/gcc9-20190401
        cd ..
        clangFolder="$(pwd)/Getclang/bin/clang"
        gccFolder="$(pwd)/GetGcc/bin/aarch64-linux-gnu-"
    else
        # default use avalon clang
        cd Getclang
        git checkout avalon/11.0.1
        cd ..
        cd GetGcc
        git checkout gcc-9-latest/master
        cd ..
        clangFolder="$(pwd)/Getclang/bin/clang"
        gccFolder="$(pwd)/GetGcc/aarch64-linux-elf/bin/aarch64-linux-elf-"
    fi
}
if [ ! -z "$1" ] && [ "$1" == "get-kernel" ];then
    TAGKENEL="LA.UM.8.2.r1-06300-sdm660.0"
    git clone https://$githubKey@github.com/ZyCromerZ/X01BD_Kernel.git -b $branch $folder
    cd $folder
    git fetch origin rebase-20200313-rename rebase-20200313-SAR rebase-20200313-$TAGKENEL
    git clone --depth=1 https://github.com/ZyCromerZ/AnyKernel3 AnyKernel
    export ARCH="arm64"
    export KBUILD_BUILD_USER="ZyCromerZ"
    export KBUILD_BUILD_HOST="circleCi-server"
    IMAGE="$(pwd)/out/arch/arm64/boot/Image.gz-dtb"
fi
echo "include main.sh success"
## info builder
# build A B C
# A = type,none = 60Hz
# B = send to 
# C = chat_id telegram
