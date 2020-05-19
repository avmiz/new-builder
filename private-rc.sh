#!/usr/bin/env bash
################################################################################################ Avalon
    branch="private/20200313-rc"
    folder="all"
    FolderUpload="X01BD/KERNEL/Protected"
    spectrumFile="pk.rc"
    . main-b.sh "get-kernel"
    Getclang "dtc"
    Getclang "GCC"

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    # CONFIG_HZ="1000"
    build "QDTC60Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC"
    build "QDTC65Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QDTC68Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QDTC71Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    build "PDTC60Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PDTC65Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PDTC68Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PDTC71Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    clean_build

################################################################################################ GCC
    change_branch
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    CONFIG_HZ="100"
    build "QGCC60Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC"
    build "QGCC65Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QGCC68Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QGCC71Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    build "PGCC60Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PGCC65Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PGCC68Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PGCC71Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    clean_build

################################################################################################ Proton
    change_branch
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    # CONFIG_HZ="1000"
    build "QProton60Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC"
    build "QProton65Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QProton68Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QProton71Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    build "PProton60Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PProton65Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PProton68Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PProton71Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    clean_build

################################################################################################ Avalon
    change_branch
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    # CONFIG_HZ="1000"
    build "QAvalon60Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC"
    build "QAvalon65Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QAvalon68Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QAvalon71Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    build "PAvalon60Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PAvalon65Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PAvalon68Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PAvalon71Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    clean_build