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
    build "QDTC65Hz" "" "$chat_group_id" 
    build "QDTC66Hz" "" "$chat_group_id" 
    build "QDTC67Hz" "" "$chat_group_id" 
    build "QDTC68Hz" "" "$chat_group_id" 
    build "QDTC69Hz" "" "$chat_group_id" 
    build "QDTC71Hz" "" "$chat_group_id" 

    # sendInfo "build QuantumKiller-N done . . ."

    ## for pie
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    # FolderUpload="X01BD/KERNEL/EG/Release-Candidate/F"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    # sendInfo "starting build DeadlyCute-N . . ."

    build "PDTC60Hz" "" "$chat_group_id" 
    build "PDTC65Hz" "" "$chat_group_id" 
    build "PDTC66Hz" "" "$chat_group_id" 
    build "PDTC67Hz" "" "$chat_group_id" 
    build "PDTC68Hz" "" "$chat_group_id" 
    build "PDTC69Hz" "" "$chat_group_id" 
    build "PDTC71Hz" "" "$chat_group_id" 

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
    build "QAvalon65Hz" "" "$chat_group_id" 
    build "QAvalon66Hz" "" "$chat_group_id" 
    build "QAvalon67Hz" "" "$chat_group_id" 
    build "QAvalon68Hz" "" "$chat_group_id" 
    build "QAvalon69Hz" "" "$chat_group_id" 
    build "QAvalon71Hz" "" "$chat_group_id" 

    # sendInfo "build QuantumKiller-N done . . ."

    ## for pie
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    # FolderUpload="X01BD/KERNEL/EG/Release-Candidate/F"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    # sendInfo "starting build DeadlyCute-N . . ."

    build "PAvalon60Hz" "" "$chat_group_id" 
    build "PAvalon65Hz" "" "$chat_group_id" 
    build "PAvalon66Hz" "" "$chat_group_id" 
    build "PAvalon67Hz" "" "$chat_group_id" 
    build "PAvalon68Hz" "" "$chat_group_id" 
    build "PAvalon69Hz" "" "$chat_group_id" 
    build "PAvalon71Hz" "" "$chat_group_id" 

    # sendInfo "build DeadlyCute-N done . . ."

    clean_build
    change_branch
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    # CONFIG_HZ="1000"
    # sendInfo "starting build QuantumKiller-N . . ."

    build "QStormbreaker60Hz" "" "$chat_group_id"
    build "QStormbreaker65Hz" "" "$chat_group_id" 
    build "QStormbreaker66Hz" "" "$chat_group_id" 
    build "QStormbreaker67Hz" "" "$chat_group_id" 
    build "QStormbreaker68Hz" "" "$chat_group_id" 
    build "QStormbreaker69Hz" "" "$chat_group_id" 
    build "QStormbreaker71Hz" "" "$chat_group_id" 

    # sendInfo "build QuantumKiller-N done . . ."

    ## for pie
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    # FolderUpload="X01BD/KERNEL/EG/Release-Candidate/F"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    # sendInfo "starting build DeadlyCute-N . . ."

    build "PStormbreaker60Hz" "" "$chat_group_id" 
    build "PStormbreaker65Hz" "" "$chat_group_id" 
    build "PStormbreaker66Hz" "" "$chat_group_id" 
    build "PStormbreaker67Hz" "" "$chat_group_id" 
    build "PStormbreaker68Hz" "" "$chat_group_id" 
    build "PStormbreaker69Hz" "" "$chat_group_id" 
    build "PStormbreaker71Hz" "" "$chat_group_id" 

    # sendInfo "build DeadlyCute-N done . . ."

    clean_build

cd ..
rm -rf $folder