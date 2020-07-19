#!/usr/bin/env bash
if [ ! -z "$1" ] && [ "$1" == "get-kernel" ];then
    if [ ! -d $folder ];then
        git clone https://$githubKey@github.com/ZyCromerZ/begonia_kernel -b $branch $folder --depth=1
        cd $folder
    else
        cd $folder
        git fetch origin $branch
        [ ! -z "$(git branch | grep "$branch" )" ] && git branch -D $branch
        git checkout -b $branch
    fi
    if [ ! -d "AnyKernel" ];then
        git clone --depth=1 https://github.com/ZyCromerZ/AnyKernel3 -b master-begonia AnyKernel 
    else
        cd "AnyKernel"
        git fetch origin master-begonia && git checkout origin/master-begonia && git branch -D master-begonia && git checkout -b master-begonia
        cd ..
    fi
    ProjectId="zyc-kernel"
    SetDefconfig="begonia_user_defconfig"
    SetDevices="Begonia"
    SetDevicesInfo="Redmi Note 8 pro"
    SetArch="arm64"
    TypeBuid="Stable"
    IMAGE="$(pwd)/out/arch/$SetArch/boot/Image.gz-dtb"
    export ARCH="$SetArch"
    export KBUILD_BUILD_USER="ZyCromerZ"
    export KBUILD_BUILD_HOST="CircleCI-server"
fi
function sendInfo(){
    if [ ! -z "$2" ];then
        sendTo="$2"
    else
        sendTo="$chat_id"
    fi
    curl -s -X POST "https://api.telegram.org/bot$token/sendMessage" \
        -d chat_id="$sendTo" \
        -d "disable_web_page_preview=true" \
        -d "parse_mode=html" \
        -d text="$1" 1>/dev/null 2>/dev/null
}
function sendToTele(){
    echo  "send To tele"
    ZIP="$1"
    if [ "$3" != "" ];then
        RefreshRT="$3(oc)"
    else
        RefreshRT="60Hz(default)"
    fi
    if [ "$clangFolder" == "" ];then
        Text="New kernel !!
Build took $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) second(s).

- Devices : $SetDevices ($SetDevicesInfo)
- Type : $TypeBuid
- Kernel name : $2
- Refreshrate : $RefreshRT
- Password Protected : $withPassword 
$SetPassword
 
Using compiler: 
- <code>$(${gccFolder}gcc --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g')</code>"
    else
        Text="New kernel !!
Build took $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) second(s).

- Devices : $SetDevices ($SetDevicesInfo)
- Type : $TypeBuid
- Kernel name : $2
- Refreshrate : $RefreshRT
- Password Protected : $withPassword 
$SetPassword
 
Using compiler: 
- <code>$(${gccFolder}gcc --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g')</code>
- <code>$(${clangFolder} --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g')</code>"
    fi
    curl -F document=@$ZIP "https://api.telegram.org/bot$token/sendDocument" \
        -F chat_id="$chat_id" \
        -F "disable_web_page_preview=true" \
        -F "parse_mode=html" \
        -F caption="$Text" 1>/dev/null 2>/dev/null
}
function sendToSf(){
    echo "upload to sf"
    Zip_File="$(pwd)/$1"
    rsync -avP -e "ssh -o StrictHostKeyChecking=no" "$Zip_File" "$my_host@frs.sourceforge.net:/home/frs/project/$ProjectId/$FolderUpload/" 1>/dev/null 2>/dev/null
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
    if [ "$clangFolder" == "" ];then
        Text="New kernel !!
Build took $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) second(s).

- Devices : $SetDevices ($SetDevicesInfo)
- Type : $TypeBuid
- Kernel name : $2
- Refreshrate : $RefreshRT
- Password Protected : $withPassword 
$SetPassword
 
Using compiler: 
- <code>$(${gccFolder}gcc --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g')</code>

Link Download : <a href='https://sourceforge.net/projects/$ProjectId/files/$FolderUpload/$createLink/download'>link download $1 ready!!! </a>"
    else
        Text="New kernel !!
Build took $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) second(s).

- Devices : $SetDevices ($SetDevicesInfo)
- Type : $TypeBuid
- Kernel name : $2
- Refreshrate : $RefreshRT
- Password Protected : $withPassword 
$SetPassword
 
Using compiler: 
- <code>$(${gccFolder}gcc --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g')</code>
- <code>$(${clangFolder} --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g')</code>

Link Download : <a href='https://sourceforge.net/projects/$ProjectId/files/$FolderUpload/$createLink/download'>link download $1 ready!!! </a>"
    fi
    
    # if [ "$withPassword" == "YES" ];then
    #     # sendInfo "$Text" "$chat_password_id"
    #     sendInfo "$Text" "-1001301538740"
    # else
    #     sendInfo "$Text"
    # fi
}
function makeZip(){
    echo 'get kernel name . . .'
    if [ ! -z "$(cat "$(pwd)/arch/$SetArch/configs/$SetDefconfig" | grep "CONFIG_LOCALVERSION=" | sed 's/CONFIG_LOCALVERSION="-*//g' | sed 's/"*//g' )" ];then
        KERNEL_NAME=$(cat "$(pwd)/arch/$SetArch/configs/$SetDefconfig" | grep "CONFIG_LOCALVERSION=" | sed 's/CONFIG_LOCALVERSION="-*//g' | sed 's/"*//g' )
    else
        KERNEL_NAME=""
    fi
    echo 'get kernel version . . .'
    ZIP_KERNEL_VERSION="4.4.$(cat "$(pwd)/Makefile" | grep "SUBLEVEL =" | sed 's/SUBLEVEL = *//g')$(cat "$(pwd)/Makefile" | grep "EXTRAVERSION =" | sed 's/EXTRAVERSION = *//g')"
    if [ ! -d "AnyKernel" ];then
        git clone --depth=1 https://github.com/ZyCromerZ/AnyKernel3 -b master-begonia AnyKernel 
        cd "AnyKernel"
    else
        cd "AnyKernel"
        git fetch origin master-begonia && git checkout origin/master-begonia && git branch -D master-begonia && git checkout -b master-begonia
    fi
    if [ ! -d "spectrum" ];then
        git clone https://$githubKey@github.com/ZyCromerZ/spectrum.git spectrum
    else
        cd spectrum
        git fetch origin master && git checkout origin/master
        [ ! -z "$(git branch | grep master)" ] && git branch -D master
        git checkout -b master
        cd ..
    fi
    if [ -e "spectrum/$spectrumFile" ];then
        cp -af "spectrum/$spectrumFile" init.spectrum.rc
        sed -i "s/persist.spectrum.kernel.*/persist.spectrum.kernel $KERNEL_NAME/g" init.spectrum.rc
    else
        if [ -e "init.spectrum.rc" ];then
            rm -rf init.spectrum.rc
        fi
    fi
    cp -af anykernel-real.sh anykernel.sh
    sed -i "s/kernel.string=.*/kernel.string=$KERNEL_NAME-$HeadCommit by ZyCromerZ/g" anykernel.sh
    if  [ "$TypeBuid" != "Stable" ];then
        ZipName="[$TypeBuid][$TANGGAL][$SetDevices]$ZIP_KERNEL_VERSION-$KERNEL_NAME-$HeadCommit.zip"
    else
        ZipName="[$TANGGAL][$SetDevices]$ZIP_KERNEL_VERSION-$KERNEL_NAME-$HeadCommit.zip"
    fi
    zip -r $ZipName ./ -x /.git/**\* ./anykernel-real.sh ./.gitignore ./LICENSE ./README.md ./spectrum/**\* ./*.zip  1>/dev/null 2>/dev/null 2>&1
    if [ "$withPassword" == "YES" ];then
        zip -r --password "$3" "$ZipName-protected.zip" $ZipName 1>/dev/null 2>/dev/null 2>&1
        rm -rf "$ZipName"
        setName="$ZipName-protected.zip"
        ZipName="$setName"
        SetPassword="- Password Kernel : <code>$3</code>"
    else
        SetPassword=""
    fi
    SendToSfStatus="nope"
    if [ ! -z "$2" ] && [ "$2" == "tele" ];then
        sendToTele "$ZipName" "$KERNEL_NAME"
        SendToSfStatus="done"
    else
        sendToSf "$ZipName" "$KERNEL_NAME"
    fi
    if [ "$TypeBuid" != "Stable" ] && [ "$SendToSfStatus" == "nope" ];then
        sendToTele "$ZipName" "$KERNEL_NAME"
    fi
    rm -rf "$ZipName"
    cd ..

}
function clean_build() {
    make -j$(($GetCore)) O=out clean mrproper 1>/dev/null 2>/dev/null
    make -j$(($GetCore)) clean mrproper 1>/dev/null 2>/dev/null
    git checkout origin/$branch && git branch -D $branch 1>/dev/null 2>/dev/null
}
function makeCleanOnly(){
    make -j$(($GetCore)) O=out clean mrproper 1>/dev/null 2>/dev/null
    make -j$(($GetCore)) clean mrproper 1>/dev/null 2>/dev/null
}
function change_branch() {
    git fetch origin $branch && git checkout FETCH_HEAD  && git checkout -b $branch 1>/dev/null 2>/dev/null
}
function compileNow(){
    make -j$(($GetCore))  O=out ARCH="$SetArch" "$SetDefconfig"
    if [ "$clangFolder" != "" ];then
        make -j$(($GetCore))  O=out \
                                ARCH="$SetArch" \
                                CROSS_COMPILE=$gccFolder \
                                CC="$clangFolder" \
                                CLANG_TRIPLE=aarch64-linux-gnu-
    else
        make -j$(($GetCore))  O=out \
                                ARCH="$SetArch" \
                                CROSS_COMPILE="$gccFolder"
    fi
}
function update_file() {
    if [ ! -z "$1" ] && [ ! -z "$2" ] && [ ! -z "$3" ];then
        GetValue="$(cat $3 | grep "$1")"
        GetPath=${3/"."/""}
        ValOri="$(echo "$GetValue" | awk -F '\\=' '{print $2}')"
        UpdateTo="$(echo "$2" | awk -F '\\=' '{print $2}')"
        [ "$ValOri" != "$UpdateTo" ] && \
        sed -i "s/$1.*/$2/g" "$3"
        [ ! -z "$(git status | grep "modified" )" ] && \
        git add "$3" && \
        git commit -s -m "$GetPath: '$GetValue' update to '$2'"
    fi
}
function build(){
    git reset --hard $HeadCommit
    if [ ! -z "$3" ];then
        chat_id="$3"
    fi
    GetCore=$(nproc --all)
    GetCommit=$(git log --pretty=format:'%h' -1)
    TANGGAL=$(date +"%m%d")
    START=$(date +"%s")
    compileNow
    cp -af out/arch/$SetArch/boot/Image.gz-dtb AnyKernel
    END=$(date +"%s")
    DIFF=$(($END - $START))
    withPassword="NO"
    if [ ! -z "$4" ];then
        withPassword="YES"
        makeZip "$1" "$2" "$4"
    else
        makeZip "$1" "$2"
    fi
}
function Getclang(){
    [ ! -d "$(pwd)/GetGcc" ] && mkdir Getclang
    cd Getclang
    [ ! -d ".git" ] && git init
    if [ "$1" == 'dtc' ];then
        setRemote "https://github.com/Bikram557/DragonTC-10.0.git" "dtc" "dragontc"
    else
        setRemote "https://github.com/ZyCromerZ/google-clang.git" "gugel-clang" "9.0.4-r353983d"
    fi
    cd ..
    [ ! -d "$(pwd)/GetGcc" ] && mkdir GetGcc
    cd GetGcc
    [ ! -d ".git" ] && git init
    setRemote "https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9" "gcc-google" "master"
    cd ..
    # [ ! -d "$(pwd)/GetGccB" ] && mkdir GetGccB
    # cd GetGccB
    # cd ..
}
function SetClang(){
    cd Getclang
    if [ "$1" == 'dtc' ];then
        git checkout dtc/dragontc
    else
        git fetch gugel-clang 9.0.4-r353983d
        git checkout FETCH_HEAD
    fi
    cd ..
    cd GetGcc
    git fetch gcc-google master
    git checkout FETCH_HEAD
    cd ..
    # cd GetGccB
    # git fetch gcc-google ndk-r19
    # git checkout FETCH_HEAD
    # cd ..
    clangFolder="$(pwd)/Getclang/bin/clang"
    gccFolder="$(pwd)/GetGcc/bin/aarch64-linux-android-"
}
function setRemote(){
    #link remote branch-name
    [ ! -z "$(git remote | grep "$2")" ] && git remote remove $2
    git remote add $2 $1
    git fetch $2 $3 --depth=1
}
echo "include main.sh success"
## info builder
# build A B C
# A = type,none = 60Hz
# B = send to 
# C = chat_id telegram
