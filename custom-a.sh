#!/usr/bin/env bash
################################################################################################ EG F DTC
    branch="custom/20200313/miuixdc"
    folder="all"
    # FolderUpload="X01BD/KERNEL/EG/STABLE/F"
    spectrumFile="ul.rc"
    . main-b.sh "get-kernel"
    Getclang 'dtc'

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="-1001434683571"
    # sendInfo "starting build QuantumKiller-N . . ."

    build "QDTC60Hz" "tele" "-1001434683571"

    git reset --hard $MainCommit
    git revert a5958117038a83e4ca4f38ac02baaec4a48304c5 --no-commit
    git commit -s -m "revert: a5958117038a83e4ca4f38ac02baaec4a48304c5"

    # FolderUpload="X01BD/KERNEL/EG/Release-Candidate/F"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    build "PDTC60Hz" "tele" "-1001434683571"
    
cd ..
rm -rf $folder