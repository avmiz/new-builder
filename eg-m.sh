#!/usr/bin/env bash
################################################################################################ EG M DTC
    branch="eg/20200313/m"
    folder="all"
    FolderUpload="X01BD/KERNEL/EG/STABLE/M"
    spectrumFile="m.rc"
    . main-b.sh "get-kernel"
    Getclang 'dtc' && Getclang 'avalon' && Getclang 'stormbreaker'

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    # CONFIG_HZ="1000"
    # sendInfo "starting build QuantumKiller-N . . ."

    build "QDTC60Hz" "" "$chat_group_id"
    build "QDTC65Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "QDTC66Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "QDTC67Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "QDTC68Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "QDTC69Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "QDTC71Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "QDTC72Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."

    # sendInfo "build QuantumKiller-N done . . ."

    ## for pie
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    # FolderUpload="X01BD/KERNEL/EG/Release-Candidate/F"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    # sendInfo "starting build DeadlyCute-N . . ."

    build "PDTC60Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PDTC65Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PDTC66Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PDTC67Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PDTC68Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PDTC69Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PDTC71Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PDTC72Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."

    # sendInfo "build DeadlyCute-N done . . ."

    clean_build

    change_branch
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    # CONFIG_HZ="1000"
    # sendInfo "starting build QuantumKiller-N . . ."

    build "QAvalon60Hz" "" "$chat_group_id"
    build "QAvalon65Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "QAvalon66Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "QAvalon67Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "QAvalon68Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "QAvalon69Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "QAvalon71Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "QAvalon72Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."

    # sendInfo "build QuantumKiller-N done . . ."

    ## for pie
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    # FolderUpload="X01BD/KERNEL/EG/Release-Candidate/F"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    # sendInfo "starting build DeadlyCute-N . . ."

    build "PAvalon60Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PAvalon65Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PAvalon66Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PAvalon67Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PAvalon68Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PAvalon69Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PAvalon71Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PAvalon72Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."

    # sendInfo "build DeadlyCute-N done . . ."

    clean_build
    change_branch
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    # CONFIG_HZ="1000"
    # sendInfo "starting build QuantumKiller-N . . ."

    build "QProton60Hz" "" "$chat_group_id"
    build "QProton65Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "QProton66Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "QProton67Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "QProton68Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "QProton69Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "QProton71Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "QProton72Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."

    # sendInfo "build QuantumKiller-N done . . ."

    ## for pie
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    # FolderUpload="X01BD/KERNEL/EG/Release-Candidate/F"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    # sendInfo "starting build DeadlyCute-N . . ."

    build "PProton60Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PProton65Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PProton66Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PProton67Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PProton68Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PProton69Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PProton71Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PProton72Hz" "" "$chat_group_id" 1>/dev/null 2>/dev/null && echo "build done . . ."

    # sendInfo "build DeadlyCute-N done . . ."

    clean_build

cd ..
rm -rf $folder