#!/usr/bin/env bash
################################################################################################ Avalon
    branch="private/20200313-oc"
    folder="all"
    FolderUpload="X01BD/KERNEL/Protected"
    spectrumFile="pk-oc.rc"
    . main-b.sh "get-kernel"
    Getclang

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    # CONFIG_HZ="1000"
    build "QStormbreaker60Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC"
    build "QStormbreaker65Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QStormbreaker66Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QStormbreaker67Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QStormbreaker68Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QStormbreaker69Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QStormbreaker71Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    build "PStormbreaker60Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PStormbreaker65Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PStormbreaker66Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PStormbreaker67Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PStormbreaker68Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PStormbreaker69Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PStormbreaker71Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    clean_build
