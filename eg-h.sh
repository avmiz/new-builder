#!/usr/bin/env bash
################################################################################################ EG H DTC
    branch="eg/20200313/h"
    folder="all"
    FolderUpload="X01BD/KERNEL/EG/STABLE/H"
    spectrumFile="h.rc"
    . main-b.sh "get-kernel"
    Getclang 'dtc'

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    # CONFIG_HZ="1000"
    # sendInfo "starting build QuantumKiller-N . . ."

    build "QDTC60Hz" "" "$chat_group_id"
    build "QDTC65Hz" "" "$chat_group_id" >/dev/null
    build "QDTC66Hz" "" "$chat_group_id" >/dev/null
    build "QDTC67Hz" "" "$chat_group_id" >/dev/null
    build "QDTC68Hz" "" "$chat_group_id" >/dev/null
    build "QDTC69Hz" "" "$chat_group_id" >/dev/null
    build "QDTC71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build QuantumKiller-N done . . ."

    ## for pie
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    # FolderUpload="X01BD/KERNEL/EG/Release-Candidate/F"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    # sendInfo "starting build DeadlyCute-N . . ."

    build "PDTC60Hz" "" "$chat_group_id" >/dev/null
    build "PDTC65Hz" "" "$chat_group_id" >/dev/null
    build "PDTC66Hz" "" "$chat_group_id" >/dev/null
    build "PDTC67Hz" "" "$chat_group_id" >/dev/null
    build "PDTC68Hz" "" "$chat_group_id" >/dev/null
    build "PDTC69Hz" "" "$chat_group_id" >/dev/null
    build "PDTC71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build DeadlyCute-N done . . ."

    clean_build

cd ..
rm -rf $folder