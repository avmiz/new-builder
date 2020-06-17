#!/usr/bin/env bash
################################################################################################ Memetek
    branch="rebase-pixel-Tercydux-OC-rc"
    folder="all"
    FolderUpload="Kernel/Begonia/Tercydux-TEST"
    spectrumFile="bego.rc"
    . main-c.sh "get-kernel"
    ProjectId="zyc-files"
    TypeBuid="TEST"
    Getclang
    SetClang

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"

    build "" "" "$chat_group_id"
    TypeKernel="DTC"
    cd Getclang
    setRemote "https://github.com/Bikram557/DragonTC-10.0.git" "dtc" "dragontc" 
    git fetch dtc dragontc
    git checkout FETCH_HEAD
    cd ..
    makeCleanOnly
    build "" "" "$chat_group_id"

cd ..
rm -rf $folder