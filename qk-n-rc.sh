#!/usr/bin/env bash
################################################################################################ QK N DTC
    branch="qk/20200313/n-rc"
    folder="all"
    FolderUpload="X01BD/KERNEL/QK/Release-Candidate/N"
    spectrumFile="vipn.rc"
    . main-b.sh "get-kernel"
    Getclang

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    # CONFIG_HZ="1000"
    # sendInfo "starting build QuantumKiller-N . . ."

    build "DTC60Hz" "" "$chat_group_id"
    build "DTC65Hz" "" "$chat_group_id" >/dev/null
    build "DTC68Hz" "" "$chat_group_id" >/dev/null
    build "DTC71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build QuantumKiller-N done . . ."

    ## for pie
    git reset --hard $MainCommit
    git cherry-pick 3f7999d7701391724d59ffb478b2f448a50c2172 97a48a19482d88311df54eebcb26ab6da6c8f3c6
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    FolderUpload="X01BD/KERNEL/DC/Release-Candidate/N"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    # sendInfo "starting build DeadlyCute-N . . ."

    build "DTC60Hz" "" "$chat_group_id" >/dev/null
    build "DTC65Hz" "" "$chat_group_id" >/dev/null
    build "DTC68Hz" "" "$chat_group_id" >/dev/null
    build "DTC71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build DeadlyCute-N done . . ."

    clean_build

################################################################################################ QK N Avalon
    change_branch
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    CONFIG_HZ="300"
    # sendInfo "starting build QuantumKiller-N . . ."

    build "Avalon60Hz" "" "$chat_group_id"
    build "Avalon65Hz" "" "$chat_group_id" >/dev/null
    build "Avalon68Hz" "" "$chat_group_id" >/dev/null
    build "Avalon71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build QuantumKiller-N done . . ."

    ## for pie
    git reset --hard $MainCommit
    git cherry-pick 3f7999d7701391724d59ffb478b2f448a50c2172 97a48a19482d88311df54eebcb26ab6da6c8f3c6
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    FolderUpload="X01BD/KERNEL/DC/Release-Candidate/N"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    # sendInfo "starting build DeadlyCute-N . . ."

    build "Avalon60Hz" "" "$chat_group_id" >/dev/null
    build "Avalon65Hz" "" "$chat_group_id" >/dev/null
    build "Avalon68Hz" "" "$chat_group_id" >/dev/null
    build "Avalon71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build DeadlyCute-N done . . ."

    clean_build

################################################################################################ QK N Proton
    change_branch
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    CONFIG_HZ="300"
    # sendInfo "starting build QuantumKiller-N . . ."

    build "Proton60Hz" "" "$chat_group_id"
    build "Proton65Hz" "" "$chat_group_id" >/dev/null
    build "Proton68Hz" "" "$chat_group_id" >/dev/null
    build "Proton71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build QuantumKiller-N done . . ."

    ## for pie
    git reset --hard $MainCommit
    git cherry-pick 3f7999d7701391724d59ffb478b2f448a50c2172 97a48a19482d88311df54eebcb26ab6da6c8f3c6
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    FolderUpload="X01BD/KERNEL/DC/STABLE/N"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    # sendInfo "starting build DeadlyCute-N . . ."

    build "Proton60Hz" "" "$chat_group_id" >/dev/null
    build "Proton65Hz" "" "$chat_group_id" >/dev/null
    build "Proton68Hz" "" "$chat_group_id" >/dev/null
    build "Proton71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build DeadlyCute-N done . . ."

    clean_build