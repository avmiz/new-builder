#!/usr/bin/env bash
################################################################################################ QK N RC
    branch="qk/20200313/n-rc"
    folder="all_rc"
    FolderUpload="X01BD/KERNEL/QK/Release-Candidate/N"
    spectrumFile="vipn.rc"
    . main.sh "get-kernel"

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    sendInfo "starting build QuantumKiller-N RC . . ."

    build "60Hz" "" "$chat_group_id"
    build "65Hz" "" "$chat_group_id" >/dev/null
    build "66Hz" "" "$chat_group_id" >/dev/null
    build "67Hz" "" "$chat_group_id" >/dev/null
    build "68Hz" "" "$chat_group_id" >/dev/null
    build "69Hz" "" "$chat_group_id" >/dev/null
    build "71Hz" "" "$chat_group_id" >/dev/null

    sendInfo "build QuantumKiller-N RC done . . ."

    ## for pie
    git reset --hard $MainCommit
    git cherry-pick 3f7999d7701391724d59ffb478b2f448a50c2172 97a48a19482d88311df54eebcb26ab6da6c8f3c6
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    FolderUpload="X01BD/KERNEL/DC/Release-Candidate/N"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    sendInfo "starting build DeadlyCute-N RC . . ."

    build "60Hz" "" "$chat_group_id"
    build "65Hz" "" "$chat_group_id" >/dev/null
    build "66Hz" "" "$chat_group_id" >/dev/null
    build "67Hz" "" "$chat_group_id" >/dev/null
    build "68Hz" "" "$chat_group_id" >/dev/null
    build "69Hz" "" "$chat_group_id" >/dev/null
    build "71Hz" "" "$chat_group_id" >/dev/null

    sendInfo "build DeadlyCute-N RC done . . ."

################################################################################################ QK L RC

    branch="qk/20200313/l-rc"
    FolderUpload="X01BD/KERNEL/QK/Release-Candidate/L"
    spectrumFile="vipl.rc"
    git fetch origin $branch && git checkout origin/$branch  && git checkout -b $branch

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    sendInfo "starting build QuantumKiller-L RC . . ."

    build "60Hz" "" "$chat_group_id"
    build "65Hz" "" "$chat_group_id" >/dev/null
    build "66Hz" "" "$chat_group_id" >/dev/null
    build "67Hz" "" "$chat_group_id" >/dev/null
    build "68Hz" "" "$chat_group_id" >/dev/null
    build "69Hz" "" "$chat_group_id" >/dev/null
    build "71Hz" "" "$chat_group_id" >/dev/null

    sendInfo "build QuantumKiller-L RC done . . ."

    ## for pie
    git reset --hard $MainCommit
    git cherry-pick 6471f35a09731d1cefbca7b119d6e5609abbf8ed ddd3796970a567463c18d0fb29ca67073be6d9cd
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    FolderUpload="X01BD/KERNEL/DC/Release-Candidate/L"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    sendInfo "starting build DeadlyCute-L RC . . ."

    build "60Hz" "" "$chat_group_id"
    build "65Hz" "" "$chat_group_id" >/dev/null
    build "66Hz" "" "$chat_group_id" >/dev/null
    build "67Hz" "" "$chat_group_id" >/dev/null
    build "68Hz" "" "$chat_group_id" >/dev/null
    build "69Hz" "" "$chat_group_id" >/dev/null
    build "71Hz" "" "$chat_group_id" >/dev/null

    sendInfo "build DeadlyCute-L RC done . . ."

################################################################################################ QK uL RC

    branch="qk/20200313/ul-rc"
    FolderUpload="X01BD/KERNEL/QK/Release-Candidate/uL"
    spectrumFile="ul.rc"
    git fetch origin $branch && git checkout origin/$branch  && git checkout -b $branch

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    sendInfo "starting build QuantumKiller-uL RC . . ."

    build "60Hz" "" "$chat_group_id"
    build "65Hz" "" "$chat_group_id" >/dev/null
    build "66Hz" "" "$chat_group_id" >/dev/null
    build "67Hz" "" "$chat_group_id" >/dev/null
    build "68Hz" "" "$chat_group_id" >/dev/null
    build "69Hz" "" "$chat_group_id" >/dev/null
    build "71Hz" "" "$chat_group_id" >/dev/null

    sendInfo "build QuantumKiller-uL RC done . . ."

    ## for pie
    git reset --hard $MainCommit
    git cherry-pick 7441acae77c1fa71f32495ef8c3ffabdd7b67702 7df17ba2764713e63fb2d8354321e47532fc50de
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    FolderUpload="X01BD/KERNEL/DC/Release-Candidate/uL"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    sendInfo "starting build DeadlyCute-uL RC . . ."

    build "60Hz" "" "$chat_group_id"
    build "65Hz" "" "$chat_group_id" >/dev/null
    build "66Hz" "" "$chat_group_id" >/dev/null
    build "67Hz" "" "$chat_group_id" >/dev/null
    build "68Hz" "" "$chat_group_id" >/dev/null
    build "69Hz" "" "$chat_group_id" >/dev/null
    build "71Hz" "" "$chat_group_id" >/dev/null

    sendInfo "build DeadlyCute-uL RC done . . ."

################################################################################################ EG F RC

    branch="eg/20200313/f-rc"
    FolderUpload="X01BD/KERNEL/EG/Release-Candidate/F"
    spectrumFile="f.rc"
    git fetch origin $branch && git checkout origin/$branch  && git checkout -b $branch

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    sendInfo "starting build EmptyGlory-F Q RC . . ."

    build "Q60Hz" "" "$chat_group_id"
    build "Q65Hz" "" "$chat_group_id" >/dev/null
    build "Q66Hz" "" "$chat_group_id" >/dev/null
    build "Q67Hz" "" "$chat_group_id" >/dev/null
    build "Q68Hz" "" "$chat_group_id" >/dev/null
    build "Q69Hz" "" "$chat_group_id" >/dev/null
    build "Q71Hz" "" "$chat_group_id" >/dev/null

    sendInfo "build EmptyGlory-F Q RC done . . ."

    ## for pie
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    #FolderUpload="X01BD/KERNEL/EG/Release-Candidate/F"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    sendInfo "starting build EmptyGlory-F P RC . . ."

    build "P60Hz" "" "$chat_group_id"
    build "P65Hz" "" "$chat_group_id" >/dev/null
    build "P66Hz" "" "$chat_group_id" >/dev/null
    build "P67Hz" "" "$chat_group_id" >/dev/null
    build "P68Hz" "" "$chat_group_id" >/dev/null
    build "P69Hz" "" "$chat_group_id" >/dev/null
    build "P71Hz" "" "$chat_group_id" >/dev/null

    sendInfo "build EmptyGlory-F P RC done . . ."

################################################################################################ EG M RC

    branch="eg/20200313/m-rc"
    FolderUpload="X01BD/KERNEL/EG/Release-Candidate/M"
    spectrumFile="m.rc"
    git fetch origin $branch && git checkout origin/$branch  && git checkout -b $branch

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    sendInfo "starting build EmptyGlory-M Q RC . . ."

    build "Q60Hz" "" "$chat_group_id"
    build "Q65Hz" "" "$chat_group_id" >/dev/null
    build "Q66Hz" "" "$chat_group_id" >/dev/null
    build "Q67Hz" "" "$chat_group_id" >/dev/null
    build "Q68Hz" "" "$chat_group_id" >/dev/null
    build "Q69Hz" "" "$chat_group_id" >/dev/null
    build "Q71Hz" "" "$chat_group_id" >/dev/null

    sendInfo "build EmptyGlory-M Q RC done . . ."

    ## for pie
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    #FolderUpload="X01BD/KERNEL/EG/Release-Candidate/M"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    sendInfo "starting build EmptyGlory-M P RC . . ."

    build "P60Hz" "" "$chat_group_id"
    build "P65Hz" "" "$chat_group_id" >/dev/null
    build "P66Hz" "" "$chat_group_id" >/dev/null
    build "P67Hz" "" "$chat_group_id" >/dev/null
    build "P68Hz" "" "$chat_group_id" >/dev/null
    build "P69Hz" "" "$chat_group_id" >/dev/null
    build "P71Hz" "" "$chat_group_id" >/dev/null

    sendInfo "build EmptyGlory-M P RC done . . ."

################################################################################################ EG H RC

    branch="eg/20200313/h-rc"
    FolderUpload="X01BD/KERNEL/EG/Release-Candidate/H"
    spectrumFile="h.rc"
    git fetch origin $branch && git checkout origin/$branch  && git checkout -b $branch

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    sendInfo "starting build EmptyGlory-H Q RC . . ."

    build "Q60Hz" "" "$chat_group_id"
    build "Q65Hz" "" "$chat_group_id" >/dev/null
    build "Q66Hz" "" "$chat_group_id" >/dev/null
    build "Q67Hz" "" "$chat_group_id" >/dev/null
    build "Q68Hz" "" "$chat_group_id" >/dev/null
    build "Q69Hz" "" "$chat_group_id" >/dev/null
    build "Q71Hz" "" "$chat_group_id" >/dev/null

    sendInfo "build EmptyGlory-H Q RC done . . ."

    ## for pie
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    # FolderUpload="X01BD/KERNEL/EG/Release-Candidate/H"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    sendInfo "starting build EmptyGlory-H P RC . . ."

    build "P60Hz" "" "$chat_group_id"
    build "P65Hz" "" "$chat_group_id" >/dev/null
    build "P66Hz" "" "$chat_group_id" >/dev/null
    build "P67Hz" "" "$chat_group_id" >/dev/null
    build "P68Hz" "" "$chat_group_id" >/dev/null
    build "P69Hz" "" "$chat_group_id" >/dev/null
    build "P71Hz" "" "$chat_group_id" >/dev/null

    sendInfo "build EmptyGlory-H P RC done . . ."

cd ..
rm -rf ./$folder
sendInfo "remove all kernels files on server done . . . "