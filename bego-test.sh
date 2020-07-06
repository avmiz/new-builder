#!/usr/bin/env bash
################################################################################################ Memetek
    branch="20200706/root"
    folder="all"
    FolderUpload="Kernel/Begonia/Tercydux-TEST"
    spectrumFile="bego.rc"
    . main-c.sh "get-kernel"
    ProjectId="zyc-files"
    TypeBuid="ORI-MAIN"
    Getclang
    SetClang

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"

    build "" "tele" "$chat_group_id"
    branch="20200706/upstream"
    TypeBuid="ORI-MAIN"
    clean_build
    build "" "tele" "$chat_group_id"
    branch="20200706/upstream-common"
    TypeBuid="ORI-MAIN"
    clean_build
    build "" "tele" "$chat_group_id"

cd ..
rm -rf $folder