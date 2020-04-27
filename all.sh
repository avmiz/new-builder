#!/usr/bin/env bash
################################################################################################ QK N
    branch="qk/20200313/n"
    folder="all"
    FolderUpload="X01BD/KERNEL/QK/STABLE/N"
    spectrumFile="vipn.rc"
    . main.sh "get-kernel"

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    sendInfo "starting build QuantumKiller-N . . ."

    build "60Hz" "" "$chat_group_id"
    build "65Hz" "" "$chat_group_id" >/dev/null
    build "66Hz" "" "$chat_group_id" >/dev/null
    build "67Hz" "" "$chat_group_id" >/dev/null
    build "68Hz" "" "$chat_group_id" >/dev/null
    build "69Hz" "" "$chat_group_id" >/dev/null
    build "71Hz" "" "$chat_group_id" >/dev/null

    sendInfo "build QuantumKiller-N done . . ."

    ## for pie
    git reset --hard $MainCommit
    git cherry-pick 3f7999d7701391724d59ffb478b2f448a50c2172 97a48a19482d88311df54eebcb26ab6da6c8f3c6
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    FolderUpload="X01BD/KERNEL/DC/STABLE/N"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    sendInfo "starting build DeadlyCute-N . . ."

    build "60Hz" "" "$chat_group_id"
    build "65Hz" "" "$chat_group_id" >/dev/null
    build "66Hz" "" "$chat_group_id" >/dev/null
    build "67Hz" "" "$chat_group_id" >/dev/null
    build "68Hz" "" "$chat_group_id" >/dev/null
    build "69Hz" "" "$chat_group_id" >/dev/null
    build "71Hz" "" "$chat_group_id" >/dev/null

    sendInfo "build DeadlyCute-N done . . ."

################################################################################################ QK L

    branch="qk/20200313/l"
    FolderUpload="X01BD/KERNEL/QK/STABLE/L"
    spectrumFile="vipl.rc"
    git fetch origin $branch && git checkout origin/$branch  && git checkout -b $branch

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    sendInfo "starting build QuantumKiller-L . . ."

    build "60Hz" "" "$chat_group_id"
    build "65Hz" "" "$chat_group_id" >/dev/null
    build "66Hz" "" "$chat_group_id" >/dev/null
    build "67Hz" "" "$chat_group_id" >/dev/null
    build "68Hz" "" "$chat_group_id" >/dev/null
    build "69Hz" "" "$chat_group_id" >/dev/null
    build "71Hz" "" "$chat_group_id" >/dev/null

    sendInfo "build QuantumKiller-L done . . ."

    ## for pie
    git reset --hard $MainCommit
    git cherry-pick 6471f35a09731d1cefbca7b119d6e5609abbf8ed ddd3796970a567463c18d0fb29ca67073be6d9cd
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    FolderUpload="X01BD/KERNEL/DC/STABLE/L"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    sendInfo "starting build DeadlyCute-L . . ."

    build "60Hz" "" "$chat_group_id"
    build "65Hz" "" "$chat_group_id" >/dev/null
    build "66Hz" "" "$chat_group_id" >/dev/null
    build "67Hz" "" "$chat_group_id" >/dev/null
    build "68Hz" "" "$chat_group_id" >/dev/null
    build "69Hz" "" "$chat_group_id" >/dev/null
    build "71Hz" "" "$chat_group_id" >/dev/null

    sendInfo "build DeadlyCute-L done . . ."

################################################################################################ EG F

    branch="eg/20200313/f"
    FolderUpload="X01BD/KERNEL/EG/STABLE/F"
    spectrumFile="f.rc"
    git fetch origin $branch && git checkout origin/$branch  && git checkout -b $branch

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    sendInfo "starting build EmptyGlory-F Q . . ."

    build "Q60Hz" "" "$chat_group_id"
    build "Q65Hz" "" "$chat_group_id" >/dev/null
    build "Q66Hz" "" "$chat_group_id" >/dev/null
    build "Q67Hz" "" "$chat_group_id" >/dev/null
    build "Q68Hz" "" "$chat_group_id" >/dev/null
    build "Q69Hz" "" "$chat_group_id" >/dev/null
    build "Q71Hz" "" "$chat_group_id" >/dev/null

    sendInfo "build EmptyGlory-F Q done . . ."

    ## for pie
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    #FolderUpload="X01BD/KERNEL/EG/STABLE/F"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    sendInfo "starting build EmptyGlory-F P . . ."

    build "P60Hz" "" "$chat_group_id"
    build "P65Hz" "" "$chat_group_id" >/dev/null
    build "P66Hz" "" "$chat_group_id" >/dev/null
    build "P67Hz" "" "$chat_group_id" >/dev/null
    build "P68Hz" "" "$chat_group_id" >/dev/null
    build "P69Hz" "" "$chat_group_id" >/dev/null
    build "P71Hz" "" "$chat_group_id" >/dev/null

    sendInfo "build EmptyGlory-F P done . . ."

################################################################################################ EG M

    branch="eg/20200313/m"
    folder="qk_normal"
    FolderUpload="X01BD/KERNEL/EG/STABLE/M"
    spectrumFile="m.rc"
    git fetch origin $branch && git checkout origin/$branch  && git checkout -b $branch

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    sendInfo "starting build EmptyGlory-M Q . . ."

    build "Q60Hz" "" "$chat_group_id"
    build "Q65Hz" "" "$chat_group_id" >/dev/null
    build "Q66Hz" "" "$chat_group_id" >/dev/null
    build "Q67Hz" "" "$chat_group_id" >/dev/null
    build "Q68Hz" "" "$chat_group_id" >/dev/null
    build "Q69Hz" "" "$chat_group_id" >/dev/null
    build "Q71Hz" "" "$chat_group_id" >/dev/null

    sendInfo "build EmptyGlory-M Q done . . ."

    ## for pie
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    #FolderUpload="X01BD/KERNEL/EG/STABLE/M"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    sendInfo "starting build EmptyGlory-M P . . ."

    build "P60Hz" "" "$chat_group_id"
    build "P65Hz" "" "$chat_group_id" >/dev/null
    build "P66Hz" "" "$chat_group_id" >/dev/null
    build "P67Hz" "" "$chat_group_id" >/dev/null
    build "P68Hz" "" "$chat_group_id" >/dev/null
    build "P69Hz" "" "$chat_group_id" >/dev/null
    build "P71Hz" "" "$chat_group_id" >/dev/null

    sendInfo "build EmptyGlory-M P done . . ."

################################################################################################ EG H

    branch="eg/20200313/h"
    FolderUpload="X01BD/KERNEL/EG/STABLE/H"
    spectrumFile="h.rc"
    git fetch origin $branch && git checkout origin/$branch  && git checkout -b $branch

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    sendInfo "starting build EmptyGlory-H Q . . ."

    build "Q60Hz" "" "$chat_group_id"
    build "Q65Hz" "" "$chat_group_id" >/dev/null
    build "Q66Hz" "" "$chat_group_id" >/dev/null
    build "Q67Hz" "" "$chat_group_id" >/dev/null
    build "Q68Hz" "" "$chat_group_id" >/dev/null
    build "Q69Hz" "" "$chat_group_id" >/dev/null
    build "Q71Hz" "" "$chat_group_id" >/dev/null

    sendInfo "build EmptyGlory-H Q done . . ."

    ## for pie
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    # FolderUpload="X01BD/KERNEL/EG/STABLE/H"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    sendInfo "starting build EmptyGlory-H P . . ."

    build "P60Hz" "" "$chat_group_id"
    build "P65Hz" "" "$chat_group_id" >/dev/null
    build "P66Hz" "" "$chat_group_id" >/dev/null
    build "P67Hz" "" "$chat_group_id" >/dev/null
    build "P68Hz" "" "$chat_group_id" >/dev/null
    build "P69Hz" "" "$chat_group_id" >/dev/null
    build "P71Hz" "" "$chat_group_id" >/dev/null

    sendInfo "build EmptyGlory-H P done . . ."

cd ..
rm -rf ./$folder
sendInfo "remove all kernels files on server done . . . "