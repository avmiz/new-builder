#!/usr/bin/env bash
################################################################################################ Memetek
    branch="begonia-p-oss"
    folder="all"
    FolderUpload="Kernel/Begonia/STOCK-TEST"
    spectrumFile="bego.rc"
    . main-d.sh "get-kernel"
    ProjectId="zyc-files"
    Getclang
    SetClang

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="-1001400256602"
    TypeBuid="miui-android-9"

    build "" "" "-1001400256602"

cd ..
rm -rf $folder