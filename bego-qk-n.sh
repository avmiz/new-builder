#!/usr/bin/env bash
################################################################################################ Memetek
    branch="20200706/qk-n"
    folder="all"
    FolderUpload="Kernel/Begonia/QK"
    spectrumFile="bego.rc"
    . main-c.sh "get-kernel"
    ProjectId="zyc-files"
    Getclang
    SetClang

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="-1001445939232"

    build "" "" "-1001445939232"

cd ..
rm -rf $folder