#!/usr/bin/env bash
################################################################################################ Memetek
    branch="rebase-pixel-Qk-n-rc"
    folder="all"
    FolderUpload="Kernel/Begonia/QK-TEST"
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

cd ..
rm -rf $folder