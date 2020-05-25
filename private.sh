#!/usr/bin/env bash
################################################################################################ Avalon
    branch="private/20200313"
    folder="all"
    FolderUpload="X01BD/KERNEL/Protected"
    spectrumFile="pk.rc"
    . main-b.sh "get-kernel"
    Getclang

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    # CONFIG_HZ="1000"
    build "QDTC60Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC"
    build "QDTC65Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QDTC66Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QDTC67Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QDTC68Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QDTC69Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QDTC71Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    build "PDTC60Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PDTC65Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PDTC66Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PDTC67Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PDTC68Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PDTC69Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
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
    build "QGCC66Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QGCC67Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QGCC68Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QGCC69Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QGCC71Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    build "PGCC60Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PGCC65Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PGCC66Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PGCC67Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PGCC68Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PGCC69Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PGCC71Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
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
    build "QAvalon66Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QAvalon67Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QAvalon68Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QAvalon69Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QAvalon71Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    build "PAvalon60Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PAvalon65Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PAvalon66Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PAvalon67Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PAvalon68Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PAvalon69Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PAvalon71Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
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
    build "QProton66Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QProton67Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QProton68Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QProton69Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "QProton71Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    build "PProton60Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PProton65Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PProton66Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PProton67Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PProton68Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PProton69Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    build "PProton71Hz" "" "$chat_group_id" "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)-ZyC" >/dev/null
    clean_build

################################################################################################ Stormbreaker
    change_branch
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
