#!/usr/bin/env bash
################################################################################################ Memetek
    branch="20200625/qk-n-rc"
    folder="all"
    FolderUpload="Kernel/Begonia/QK-TEST"
    spectrumFile="bego.rc"
    . main-c.sh "get-kernel"
    ProjectId="zyc-files"
    TypeBuid="Stable-RC"
    Getclang
    SetClang

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"

    build "" "" "$chat_group_id"
    Getclang 'dtc'
    SetClang 'dtc'
    TypeKernel='DTC'
    build "" "" "$chat_group_id"

cd ..
rm -rf $folder