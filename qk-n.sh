#!/usr/bin/env bash
################################################################################################ QK N DTC
    branch="qk/20200313/n"
    folder="all"
    FolderUpload="X01BD/KERNEL/QK/STABLE/N"
    spectrumFile="vipn.rc"
    . main-b.sh "get-kernel"
    Getclang 'dtc' && Getclang 'avalon' && Getclang 'stormbreaker'
    
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    # CONFIG_HZ="1000"
    # sendInfo "starting build QuantumKiller-N . . ."

    build "DTC60Hz" "" "$chat_group_id"
    build "DTC65Hz" "" "$chat_group_id" 
    build "DTC66Hz" "" "$chat_group_id" 
    build "DTC67Hz" "" "$chat_group_id" 
    build "DTC68Hz" "" "$chat_group_id" 
    build "DTC69Hz" "" "$chat_group_id" 
    build "DTC71Hz" "" "$chat_group_id" 

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

    build "DTC60Hz" "" "$chat_group_id" 
    build "DTC65Hz" "" "$chat_group_id" 
    build "DTC66Hz" "" "$chat_group_id" 
    build "DTC67Hz" "" "$chat_group_id" 
    build "DTC68Hz" "" "$chat_group_id" 
    build "DTC69Hz" "" "$chat_group_id" 
    build "DTC71Hz" "" "$chat_group_id" 

    # sendInfo "build DeadlyCute-N done . . ."

    clean_build

    change_branch
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    CONFIG_HZ="300"
    # sendInfo "starting build QuantumKiller-N . . ."

    build "Avalon60Hz" "" "$chat_group_id"
    build "Avalon65Hz" "" "$chat_group_id" 
    build "Avalon66Hz" "" "$chat_group_id" 
    build "Avalon67Hz" "" "$chat_group_id" 
    build "Avalon68Hz" "" "$chat_group_id" 
    build "Avalon69Hz" "" "$chat_group_id" 
    build "Avalon71Hz" "" "$chat_group_id" 

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

    build "Avalon60Hz" "" "$chat_group_id" 
    build "Avalon65Hz" "" "$chat_group_id" 
    build "Avalon66Hz" "" "$chat_group_id" 
    build "Avalon67Hz" "" "$chat_group_id" 
    build "Avalon68Hz" "" "$chat_group_id" 
    build "Avalon69Hz" "" "$chat_group_id" 
    build "Avalon71Hz" "" "$chat_group_id" 

    # sendInfo "build DeadlyCute-N done . . ."

    clean_build
    change_branch
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    # CONFIG_HZ="1000"
    # sendInfo "starting build QuantumKiller-N . . ."

    build "Stormbreaker60Hz" "" "$chat_group_id"
    build "Stormbreaker65Hz" "" "$chat_group_id" 
    build "Stormbreaker66Hz" "" "$chat_group_id" 
    build "Stormbreaker67Hz" "" "$chat_group_id" 
    build "Stormbreaker68Hz" "" "$chat_group_id" 
    build "Stormbreaker69Hz" "" "$chat_group_id" 
    build "Stormbreaker71Hz" "" "$chat_group_id" 

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

    build "Stormbreaker60Hz" "" "$chat_group_id" 
    build "Stormbreaker65Hz" "" "$chat_group_id" 
    build "Stormbreaker66Hz" "" "$chat_group_id" 
    build "Stormbreaker67Hz" "" "$chat_group_id" 
    build "Stormbreaker68Hz" "" "$chat_group_id" 
    build "Stormbreaker69Hz" "" "$chat_group_id" 
    build "Stormbreaker71Hz" "" "$chat_group_id" 

    # sendInfo "build DeadlyCute-N done . . ."

    clean_build

cd ..
rm -rf $folder