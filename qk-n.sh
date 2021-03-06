#!/usr/bin/env bash
################################################################################################ QK N DTC
    branch="qk/20200711/n"
    folder="all"
    FolderUpload="X01BD/KERNEL/QK/STABLE/N"
    spectrumFile="vipn.rc"
    . main-b.sh "get-kernel"
    # Getclang 'dtc' && Getclang 'Avalon' && Getclang 'stormbreaker'
    
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="-1001445939232"
    # CONFIG_HZ="300"
    # sendInfo "starting build QuantumKiller-N . . ."

    build "QDTC60Hz" "" "-1001445939232"
    build "QDTC65Hz" "" "-1001445939232" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "QDTC66Hz" "" "-1001445939232" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "QDTC67Hz" "" "-1001445939232" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "QDTC68Hz" "" "-1001445939232" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "QDTC69Hz" "" "-1001445939232" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "QDTC71Hz" "" "-1001445939232" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "QDTC72Hz" "" "-1001445939232" 1>/dev/null 2>/dev/null && echo "build done . . ."

    # sendInfo "build QuantumKiller-N done . . ."

    ## for pie
    git reset --hard $MainCommit
    git revert e3f173b6585865b3e1658802c84c52de21ec0502 --no-commit
    git commit -s -m "revert: e3f173b6585865b3e1658802c84c52de21ec0502"

    FolderUpload="X01BD/KERNEL/DC/STABLE/N"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    # sendInfo "starting build DeadlyCute-N . . ."

    build "PDTC60Hz" "" "-1001445939232" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PDTC65Hz" "" "-1001445939232" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PDTC66Hz" "" "-1001445939232" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PDTC67Hz" "" "-1001445939232" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PDTC68Hz" "" "-1001445939232" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PDTC69Hz" "" "-1001445939232" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PDTC71Hz" "" "-1001445939232" 1>/dev/null 2>/dev/null && echo "build done . . ."
    build "PDTC72Hz" "" "-1001445939232" 1>/dev/null 2>/dev/null && echo "build done . . ."
cd ..
rm -rf $folder