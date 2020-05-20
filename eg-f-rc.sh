#!/usr/bin/env bash
################################################################################################ EG F DTC
    branch="eg/20200313/f-rc"
    folder="all"
    FolderUpload="X01BD/KERNEL/EG/Release-Candidate/F"
    spectrumFile="f.rc"
    . main-b.sh "get-kernel"
    Getclang

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    # CONFIG_HZ="1000"
    # sendInfo "starting build QuantumKiller-N . . ."

    build "QDTC60Hz" "" "$chat_group_id"
    build "QDTC65Hz" "" "$chat_group_id" >/dev/null
    build "QDTC68Hz" "" "$chat_group_id" >/dev/null
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
    build "PDTC68Hz" "" "$chat_group_id" >/dev/null
    build "PDTC71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build DeadlyCute-N done . . ."

    clean_build

################################################################################################ EG F Avalon
    change_branch
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    CONFIG_HZ="300"
    # sendInfo "starting build QuantumKiller-N . . ."

    build "QAvalon60Hz" "" "$chat_group_id"
    build "QAvalon65Hz" "" "$chat_group_id" >/dev/null
    build "QAvalon68Hz" "" "$chat_group_id" >/dev/null
    build "QAvalon71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build QuantumKiller-N done . . ."

    ## for pie
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    # FolderUpload="X01BD/KERNEL/EG/STABLE/M"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    # sendInfo "starting build DeadlyCute-N . . ."

    build "PAvalon60Hz" "" "$chat_group_id" >/dev/null
    build "PAvalon65Hz" "" "$chat_group_id" >/dev/null
    build "PAvalon68Hz" "" "$chat_group_id" >/dev/null
    build "PAvalon71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build DeadlyCute-N done . . ."

    clean_build

################################################################################################ EG F Avalon
    change_branch
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    CONFIG_HZ="300"
    # sendInfo "starting build QuantumKiller-N . . ."

    build "QProton60Hz" "" "$chat_group_id"
    build "QProton65Hz" "" "$chat_group_id" >/dev/null
    build "QProton68Hz" "" "$chat_group_id" >/dev/null
    build "QProton71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build QuantumKiller-N done . . ."

    ## for pie
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    # FolderUpload="X01BD/KERNEL/EG/STABLE/M"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    # sendInfo "starting build DeadlyCute-N . . ."

    build "PProton60Hz" "" "$chat_group_id" >/dev/null
    build "PProton65Hz" "" "$chat_group_id" >/dev/null
    build "PProton68Hz" "" "$chat_group_id" >/dev/null
    build "PProton71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build DeadlyCute-N done . . ."

    clean_build