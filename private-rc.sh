#!/usr/bin/env bash
################################################################################################ Custom Kernel
    branch="private/20200313-rc"
    folder="all"
    FolderUpload="X01BD/KERNEL/Protected"
    spectrumFile="pk.rc"
    . main.sh "get-kernel"
    Getclang
    
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    # # sendInfo "starting build QuantumKiller-N . . ."

    build "QAvalon65Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC"
    build "QDTC65Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC"
    build "PGCC65Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC"

    # # sendInfo "build QuantumKiller-N done . . ."

    ## for pie
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    FolderUpload="X01BD/KERNEL/DC/STABLE/N"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    # sendInfo "starting build DeadlyCute-N . . ."

    build "PAvalon65Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PDTC65Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PGCC65Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null

    # sendInfo "build DeadlyCute-N done . . ."

    clean_build

# sendInfo "remove all kernels files on server done . . . "