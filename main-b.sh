#!/usr/bin/env bash
if [ ! -z "$1" ] && [ "$1" == "get-kernel" ];then
    if [ ! -d $folder ];then
        git clone https://$githubKey@github.com/ZyCromerZ/X01BD_Kernel.git -b $branch $folder
        cd $folder
    else
        cd $folder
        git fetch origin $branch
        [ ! -z "$(git branch | grep "$branch" )" ] && git branch -D $branch
        git checkout -b $branch
    fi
    git fetch origin rebase-20200313-rename rebase-20200313-SAR
    if [ ! -d "AnyKernel" ];then
        git clone --depth=1 https://github.com/ZyCromerZ/AnyKernel3 AnyKernel
    else
        cd "AnyKernel"
        git fetch origin master && git checkout origin/master && git branch -D master && git checkout -b master
        cd ..
    fi
    ProjectId="zyc-kernel"
    SetDefconfig="X01BD_defconfig"
    SetDevices="X01BD"
    SetDevicesInfo="Asus Max Pro M2"
    SetArch="arm64"
    SetTag="LA.UM.8.2.r1"
    SetLastTag="sdm660.0"
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
- Kernel name : $2
- Refreshrate : $RefreshRT
- Password Protected : $withPassword 
$SetPassword
 
Using compiler: 
- <code>$(${gccFolder}gcc --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g')</code>
- <code>$(${gccBFolder}gcc --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g')</code>"
    else
        Text="New kernel !!
Build took $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) second(s).

- Devices : $SetDevices ($SetDevicesInfo)
- Kernel name : $2
- Refreshrate : $RefreshRT
- Password Protected : $withPassword 
$SetPassword
 
Using compiler: 
- <code>$(${gccFolder}gcc --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g')</code>
- <code>$(${gccBFolder}gcc --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g')</code>
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
    rsync -avP -e "ssh -o StrictHostKeyChecking=no" "$Zip_File" $my_host@frs.sourceforge.net:/home/frs/project/$ProjectId/$FolderUpload/ 1>/dev/null 2>/dev/null
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
- Kernel name : $2
- Refreshrate : $RefreshRT
- Password Protected : $withPassword 
$SetPassword
 
Using compiler: 
- <code>$(${gccFolder}gcc --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g')</code>
- <code>$(${gccBFolder}gcc --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g')</code>

Link Download : <a href='https://sourceforge.net/projects/$ProjectId/files/$FolderUpload/$createLink/download'>link download $1 ready!!! </a>"
    else
        Text="New kernel !!
Build took $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) second(s).

- Devices : $SetDevices ($SetDevicesInfo)
- Kernel name : $2
- Refreshrate : $RefreshRT
- Password Protected : $withPassword 
$SetPassword
 
Using compiler: 
- <code>$(${gccFolder}gcc --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g')</code>
- <code>$(${gccBFolder}gcc --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g')</code>
- <code>$(${clangFolder} --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g')</code>

Link Download : <a href='https://sourceforge.net/projects/$ProjectId/files/$FolderUpload/$createLink/download'>link download $1 ready!!! </a>"
    fi
    
    if [ "$withPassword" == "YES" ];then
        # sendInfo "$Text" "$chat_password_id"
        sendInfo "$Text" "-1001301538740"
    else
        sendInfo "$Text"
    fi
}
function makeZip(){
    KERNEL_NAME=$(cat "$(pwd)/arch/$SetArch/configs/$SetDefconfig" | grep "CONFIG_LOCALVERSION=" | sed 's/CONFIG_LOCALVERSION="-*//g' | sed 's/"*//g' )
    ZIP_KERNEL_VERSION="4.4.$(cat "$(pwd)/Makefile" | grep "SUBLEVEL =" | sed 's/SUBLEVEL = *//g')$(cat "$(pwd)/Makefile" | grep "EXTRAVERSION =" | sed 's/EXTRAVERSION = *//g')"
    cd AnyKernel
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
        update_file "setprop persist.spectrum.kernel" "setprop persist.spectrum.kernel '$KERNEL_NAME'" "$(pwd)/init.spectrum.rc"
    else
        if [ -e "init.spectrum.rc" ];then
            rm -rf init.spectrum.rc
        fi
    fi
    Type=""
    HzNya=""
    TypeFor=""
    if [ ! -z "$1" ];then
        HzNya=${1/"Proton"/""}
        HzNya=${HzNya/"P"/""}
        HzNya=${HzNya/"QSAR"/""}
        HzNya=${HzNya/"Q"/""}
        HzNya=${HzNya/"AvalonTest"/""}
        HzNya=${HzNya/"DTCoLd"/""}
        HzNya=${HzNya/"DTC"/""}
        HzNya=${HzNya/"Avalon"/""}
        HzNya=${HzNya/"GCC"/""}
        HzNya=${HzNya/"Stormbreaker"/""}
    fi
    if [[ "$1" == *"DTCoLd"* ]];then
        Type="[DTC-With-GCC-Google]"
    elif [[ "$1" == *"DTC"* ]];then
        Type="[DTC-With-GCC-9-and-Google]"
    elif [[ "$1" == *"AvalonTest"* ]];then
        Type="[Avalon-clang-with-another-gcc]"
    elif [[ "$1" == *"Avalon"* ]];then
        Type="[Avalon-clang]"
    elif [[ "$1" == *"GCC"* ]];then
        Type="[GCC-Only]"
    elif [[ "$1" == *"Proton"* ]];then
        Type="[Proton-clang]"
    elif [[ "$1" == *"Stormbreaker"* ]];then
        Type="[Stormbreaker-clang]"
    else
        Type=""
    fi
    if [[ "$1" == *"Q"* ]];then
        TypeFor="Q"
    elif [[ "$1" == *"P"* ]];then
        TypeFor="P"
    fi
    cp -af anykernel-real.sh anykernel.sh
    sed -i "s/kernel.string=.*/kernel.string=$KERNEL_NAME-$HeadCommit by ZyCromerZ/g" anykernel.sh
    ZipName="$TypeFor$Type[$TANGGAL]$ZIP_KERNEL_VERSION-$KERNEL_NAME-$GetCommit.zip"
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
        -d text="Build kernel from branch : $branch  (<code>$1</code>) failed -_-" 1>/dev/null 2>/dev/null
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
    git fetch origin $branch && git checkout origin/$branch  && git checkout -b $branch 1>/dev/null 2>/dev/null
}
function compileNow(){
    make -j$(($GetCore))  O=out ARCH="$SetArch" "$SetDefconfig"
    if [ "$clangFolder" != "" ];then
        make -j$(($GetCore))  O=out \
                                ARCH="$SetArch" \
                                CROSS_COMPILE=$gccFolder \
                                CROSS_COMPILE_ARM32=$gccBFolder \
                                CC=$clangFolder \
                                CLANG_TRIPLE=aarch64-linux-gnu-
    else
        make -j$(($GetCore))  O=out \
                                ARCH="$SetArch" \
                                CROSS_COMPILE=$gccFolder \
                                CROSS_COMPILE_ARM32=$gccBFolder
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
    HzNya=${1/"Proton"/""}
    HzNya=${HzNya/"P"/""}
    HzNya=${HzNya/"QSAR"/""}
    HzNya=${HzNya/"Q"/""}
    HzNya=${HzNya/"AvalonTest"/""}
    HzNya=${HzNya/"DTCoLd"/""}
    HzNya=${HzNya/"DTC"/""}
    HzNya=${HzNya/"Avalon"/""}
    HzNya=${HzNya/"GCC"/""}
    HzNya=${HzNya/"Stormbreaker"/""}
    GetRefreshRate=${HzNya/"Hz"/""}
    if [ ! -z "$3" ];then
        chat_id="$3"
    fi
    if [ ! -z "$1" ];then
        update_file "qcom,mdss-dsi-panel-framerate = " "qcom,mdss-dsi-panel-framerate = <$GetRefreshRate>;" "./arch/arm/boot/dts/qcom/X01BD/dsi-panel-auo-ft8716f-5p9-fhd-video.dtsi" && \
        update_file "qcom,mdss-dsi-panel-framerate = " "qcom,mdss-dsi-panel-framerate = <$GetRefreshRate>;" "./arch/arm/boot/dts/qcom/X01BD/dsi-panel-hx83112a-1080p-video-tm.dtsi" && \
        update_file "qcom,mdss-dsi-panel-framerate = " "qcom,mdss-dsi-panel-framerate = <$GetRefreshRate>;" "./arch/arm/boot/dts/qcom/X01BD/dsi-panel-nt36672-1080p-video-txd.dtsi" && \
        update_file "qcom,mdss-dsi-panel-framerate = " "qcom,mdss-dsi-panel-framerate = <$GetRefreshRate>;" "./arch/arm/boot/dts/qcom/X01BD/dsi-panel-nt36672-1080p-video.dtsi" && \
        update_file "qcom,mdss-dsi-panel-framerate = " "qcom,mdss-dsi-panel-framerate = <$GetRefreshRate>;" "./arch/arm/boot/dts/qcom/X01BD/dsi-panel-nt36672ah-1080p-video-kd.dtsi" && \
        update_file "qcom,mdss-dsi-panel-framerate = " "qcom,mdss-dsi-panel-framerate = <$GetRefreshRate>;" "./arch/arm/boot/dts/qcom/X01BD/dsi-panel-td4310-1080p-video-txd.dtsi"
    fi
    GetCore=$(nproc --all)
    TAGKENEL="$(git log | grep "${SetTag}" | head -n 1 | awk -F '\\'${SetLastTag}'' '{print $1"'${SetLastTag}'"}' | awk -F '\\'${SetTag}'' '{print "'${SetTag}'"$2}')"
    if [ ! -z "$TAGKENEL" ];then
        export KBUILD_BUILD_HOST="CircleCI-server-$TAGKENEL"
    fi
    GetKernelName="$(cat "./arch/$SetArch/configs/$SetDefconfig" | grep "CONFIG_LOCALVERSION=" | sed 's/"//g' | sed 's/CONFIG_LOCALVERSION=//g')"
    KernelName='"'$GetKernelName'-'$HzNya'"'
    update_file "CONFIG_LOCALVERSION=" "CONFIG_LOCALVERSION=$KernelName" "./arch/$SetArch/configs/$SetDefconfig"
    if [[ "$1" == *"Avalon"* ]];then
        [ ! -d "GetGcc" ] && Getclang "avalon"
        [ ! -d "Getclang" ] && Getclang "avalon"
        [ ! -d "GetGccB" ] && Getclang "avalon"
        SetClang "avalon"
        if [[ "$1" == *"AvalonTest"* ]];then
            SetClang "Avalon-Test"
        fi
        ## disable polly optimization
        git revert 3af1ebd92122389bd4851f5e8cae6647247d0fe6 --no-commit &&  git commit -s -m "Revert: 3af1ebd92122389bd4851f5e8cae6647247d0fe6"
    elif [[ "$1" == *"Proton"* ]];then
        [ ! -d "GetGcc" ] && Getclang "proton"
        [ ! -d "Getclang" ] && Getclang "proton"
        [ ! -d "GetGccB" ] && Getclang "proton"
        ## disable polly optimization
        git revert 3af1ebd92122389bd4851f5e8cae6647247d0fe6 --no-commit &&  git commit -s -m "Revert: 3af1ebd92122389bd4851f5e8cae6647247d0fe6"
        SetClang "proton"
    elif [[ "$1" == *"Stormbreaker"* ]];then
        [ ! -d "GetGcc" ] && Getclang "stormbreaker"
        [ ! -d "Getclang" ] && Getclang "stormbreaker"
        [ ! -d "GetGccB" ] && Getclang "stormbreaker"
        ## disable polly optimization
        git revert 3af1ebd92122389bd4851f5e8cae6647247d0fe6 --no-commit &&  git commit -s -m "Revert: 3af1ebd92122389bd4851f5e8cae6647247d0fe6"
        SetClang "stormbreaker"
    elif [[ "$1" == *"DTC"* ]];then
        [ ! -d "GetGcc" ] && Getclang "dtc"
        [ ! -d "Getclang" ] && Getclang "dtc"
        [ ! -d "GetGccB" ] && Getclang "dtc"
        SetClang "dtc"
        if [[ "$1" == *"DTCoLd"* ]];then
            SetClang "dtc-old"
        fi
        ## revert some fix for gcc 9.x changes for DragonTC clang 10
        git revert 16de298c372d55c943369ae36a0ad762e1727de1 --no-commit
        git commit -s -m "Revert: 16de298c372d55c943369ae36a0ad762e1727de1"
        git revert 6b783dff671f34ba67caf11665eb8704be66dfa6 --no-commit
        git commit -s -m "Revert: 6b783dff671f34ba67caf11665eb8704be66dfa6"
        ## revert Makefile changes for DragonTC clang 10
        git cherry-pick 061921ff48ab53ace6cf0214298fe07b5153891e
        ## git cherry-pick 590be66545f2f695de4e3465cca483cc4aa0958b
    elif [[ "$1" == *"GCC"* ]];then
        [ ! -d "GetGcc" ] && Getclang "GCC"
        SetClang "GCC"
        ## revert some fix for gcc 9.x changes for DragonTC clang 10
        git revert 16de298c372d55c943369ae36a0ad762e1727de1 --no-commit
        git commit -s -m "Revert: 16de298c372d55c943369ae36a0ad762e1727de1"
        git revert 6b783dff671f34ba67caf11665eb8704be66dfa6 --no-commit
        git commit -s -m "Revert: 6b783dff671f34ba67caf11665eb8704be66dfa6"
        ## revert Makefile changes for DragonTC clang 10
        git cherry-pick 061921ff48ab53ace6cf0214298fe07b5153891e
        ## git cherry-pick 590be66545f2f695de4e3465cca483cc4aa0958b
    else
        [ ! -d "GetGcc" ] && Getclang "avalon"
        [ ! -d "Getclang" ] && Getclang "avalon"
        [ ! -d "GetGccB" ] && Getclang "avalon"
        SetClang "avalon"
    fi
    if [ ! -z "$CONFIG_HZ" ];then
        update_file "CONFIG_HZ=" "CONFIG_HZ=$CONFIG_HZ" "./arch/$SetArch/configs/$SetDefconfig"
    fi
    GetCommit=$(git log --pretty=format:'%h' -1)
    TANGGAL=$(date +"%m%d")
    START=$(date +"%s")
    compileNow
    if [ ! -f "$IMAGE" ]; then
        finerr "$1"
    else
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
    fi
}
function Getclang(){
    [ ! -d "Getclang" ] && mkdir Getclang
    cd Getclang
    [ ! -d ".git" ] && git init
    if [ "$1" == "dtc" ];then
        setRemote "https://github.com/Bikram557/DragonTC-10.0.git" "dtc" "dragontc"
    elif [ "$1" == "avalon" ];then
        setRemote "https://github.com/Haseo97/Avalon-Clang-11.0.1.git" "avalon" "11.0.1"
    elif [ "$1" == "proton" ];then
        setRemote "https://github.com/kdrag0n/proton-clang.git" "proton" "master"
    elif [ "$1" == "stormbreaker" ];then
        setRemote "https://github.com/stormbreaker-project/stormbreaker-clang.git" "stormbreaker" "11.x"
    else
        setRemote "https://github.com/Haseo97/Avalon-Clang-11.0.1.git" "avalon" "11.0.1"
        setRemote "https://github.com/kdrag0n/proton-clang.git" "proton" "master"
        setRemote "https://github.com/Bikram557/DragonTC-10.0.git" "dtc" "dragontc"
        setRemote "https://github.com/stormbreaker-project/stormbreaker-clang.git" "stormbreaker" "11.x"
    fi
    cd ..
    [ ! -d "GetGcc" ] && mkdir GetGcc
    cd GetGcc
    [ ! -d ".git" ] && git init
    if [ "$1" == "dtc" ];then
        setRemote "https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9" "gcc-google" "master"
    elif [ "$1" == "GCC" ];then
        setRemote "https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9" "gcc-google" "master"
    else
        setRemote "https://github.com/najahiiii/aarch64-linux-gnu.git" "gcc-9-old" "gcc9-20190401"
        setRemote "https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9" "gcc-google" "master"
    fi
    cd ..
    [ ! -d "GetGccB" ] && mkdir GetGccB
    cd GetGccB
    [ ! -d ".git" ] && git init
    if [ "$1" == "dtc" ];then
        setRemote "https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9" "gcc-google" "master"
    elif [ "$1" == "GCC" ];then
        setRemote "https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9" "gcc-google" "master"
    else
        setRemote "https://github.com/arter97/arm32-gcc" "gcc-9-latest" "master"
        setRemote "https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9" "gcc-google" "master"
    fi
    cd ..
}
function SetClang(){
    if [ "$1" == "avalon" ];then
        cd Getclang
        git checkout avalon/11.0.1
        cd ..
        clangFolder="$(pwd)/Getclang/bin/clang"
        gccFolder="$(pwd)/Getclang/bin/aarch64-linux-gnu-"
        gccBFolder="$(pwd)/Getclang/bin/arm-linux-gnueabi-"
    elif [ "$1" == "proton" ];then
        cd Getclang
        git checkout proton/master
        cd ..
        clangFolder="$(pwd)/Getclang/bin/clang"
        gccFolder="$(pwd)/Getclang/bin/aarch64-linux-gnu-"
        gccBFolder="$(pwd)/Getclang/bin/arm-linux-gnueabi-"
    elif [ "$1" == "stormbreaker" ];then
        cd Getclang
        git checkout stormbreaker/11.x
        cd ..
        clangFolder="$(pwd)/Getclang/bin/clang"
        gccFolder="$(pwd)/Getclang/bin/aarch64-linux-gnu-"
        gccBFolder="$(pwd)/Getclang/bin/arm-linux-gnueabi-"
    elif [ "$1" == "GCC" ];then
        cd GetGcc
        git fetch gcc-google master
        git checkout FETCH_HEAD
        cd ..
        cd GetGccB
        git fetch gcc-google master
        git checkout FETCH_HEAD
        cd ..
        clangFolder=""
        gccFolder="$(pwd)/GetGcc/bin/aarch64-linux-android-"
        gccBFolder="$(pwd)/GetGccB/bin/arm-linux-androideabi-"
    elif [ "$1" == "dtc" ];then
        cd Getclang
        git checkout dtc/dragontc
        cd ..
        cd GetGcc
        git fetch gcc-google master
        git checkout FETCH_HEAD
        cd ..
        cd GetGccB
        git fetch gcc-google master
        git checkout FETCH_HEAD
        cd ..
        clangFolder="$(pwd)/Getclang/bin/clang"
        gccFolder="$(pwd)/GetGcc/bin/aarch64-linux-android-"
        gccBFolder="$(pwd)/GetGccB/bin/arm-linux-androideabi-"
    else
        # default use avalon clang
        cd Getclang
        git checkout avalon/11.0.1
        cd ..
        cd GetGcc
        git checkout gcc-9-latest
        cd ..
        cd GetGccB
        git checkout gcc-9-latest
        cd ..
        clangFolder="$(pwd)/Getclang/bin/clang"
        gccFolder="$(pwd)/GetGcc/bin/aarch64-elf-"
        gccBFolder="$(pwd)/GetGccB/bin/arm-eabi-"
    fi
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
