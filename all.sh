#!/usr/bin/env bash
################################################################################################ QK N
    branch="qk/20200313/n"
    folder="all"
    FolderUpload="X01BD/KERNEL/QK/STABLE/N"
    spectrumFile="vipn.rc"
    . main.sh "get-kernel"
    Getclang

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
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

    FolderUpload="X01BD/KERNEL/DC/STABLE/N"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    # sendInfo "starting build DeadlyCute-N . . ."

    build "Avalon60Hz" "" "$chat_group_id" >/dev/null
    build "Avalon65Hz" "" "$chat_group_id" >/dev/null
    build "Avalon68Hz" "" "$chat_group_id" >/dev/null
    build "Avalon71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build DeadlyCute-N done . . ."

    clean_build

################################################################################################ QK L

    branch="qk/20200313/l"
    FolderUpload="X01BD/KERNEL/QK/STABLE/L"
    spectrumFile="vipl.rc"
    change_branch

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    # sendInfo "starting build QuantumKiller-L . . ."

    build "Avalon60Hz" "" "$chat_group_id" >/dev/null
    build "Avalon65Hz" "" "$chat_group_id" >/dev/null
    build "Avalon68Hz" "" "$chat_group_id" >/dev/null
    build "Avalon71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build QuantumKiller-L done . . ."

    ## for pie
    git reset --hard $MainCommit
    git cherry-pick 6471f35a09731d1cefbca7b119d6e5609abbf8ed ddd3796970a567463c18d0fb29ca67073be6d9cd
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    FolderUpload="X01BD/KERNEL/DC/STABLE/L"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    # sendInfo "starting build DeadlyCute-L . . ."

    build "Avalon60Hz" "" "$chat_group_id" >/dev/null
    build "Avalon65Hz" "" "$chat_group_id" >/dev/null
    build "Avalon68Hz" "" "$chat_group_id" >/dev/null
    build "Avalon71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build DeadlyCute-L done . . ."

    clean_build

################################################################################################ QK uL

    branch="qk/20200313/ul"
    FolderUpload="X01BD/KERNEL/QK/STABLE/uL"
    spectrumFile="ul.rc"
    change_branch

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    # sendInfo "starting build QuantumKiller-uL . . ."

    build "Avalon60Hz" "" "$chat_group_id" >/dev/null
    build "Avalon65Hz" "" "$chat_group_id" >/dev/null
    build "Avalon68Hz" "" "$chat_group_id" >/dev/null
    build "Avalon71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build QuantumKiller-uL done . . ."

    ## for pie
    git reset --hard $MainCommit
    git cherry-pick 7441acae77c1fa71f32495ef8c3ffabdd7b67702 7df17ba2764713e63fb2d8354321e47532fc50de
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    FolderUpload="X01BD/KERNEL/DC/STABLE/uL"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    # sendInfo "starting build DeadlyCute-uL . . ."

    build "Avalon60Hz" "" "$chat_group_id" >/dev/null
    build "Avalon65Hz" "" "$chat_group_id" >/dev/null
    build "Avalon68Hz" "" "$chat_group_id" >/dev/null
    build "Avalon71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build DeadlyCute-uL done . . ."

    clean_build

################################################################################################ EG F

    branch="eg/20200313/f"
    FolderUpload="X01BD/KERNEL/EG/STABLE/F"
    spectrumFile="f.rc"
    change_branch

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    # sendInfo "starting build EmptyGlory-F Q . . ."

    build "AvalonQ60Hz" "" "$chat_group_id" >/dev/null
    build "AvalonQ65Hz" "" "$chat_group_id" >/dev/null
    build "AvalonQ68Hz" "" "$chat_group_id" >/dev/null
    build "AvalonQ71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build EmptyGlory-F Q done . . ."

    ## for pie
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    #FolderUpload="X01BD/KERNEL/EG/STABLE/F"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    # sendInfo "starting build EmptyGlory-F P . . ."

    build "AvalonP60Hz" "" "$chat_group_id" >/dev/null
    build "AvalonP65Hz" "" "$chat_group_id" >/dev/null
    build "AvalonP68Hz" "" "$chat_group_id" >/dev/null
    build "AvalonP71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build EmptyGlory-F P done . . ."

    clean_build

################################################################################################ QK N
    branch="qk/20200313/n"
    FolderUpload="X01BD/KERNEL/QK/STABLE/N"
    spectrumFile="vipn.rc"
    change_branch

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    # sendInfo "starting build QuantumKiller-N . . ."

    build "DTC60Hz" "" "$chat_group_id" >/dev/null
    build "DTC65Hz" "" "$chat_group_id" >/dev/null
    build "DTC68Hz" "" "$chat_group_id" >/dev/null
    build "DTC71Hz" "" "$chat_group_id" >/dev/null

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

    build "DTC60Hz" "" "$chat_group_id" >/dev/null
    build "DTC65Hz" "" "$chat_group_id" >/dev/null
    build "DTC68Hz" "" "$chat_group_id" >/dev/null
    build "DTC71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build DeadlyCute-N done . . ."

    clean_build

################################################################################################ EG F

    branch="eg/20200313/f"
    FolderUpload="X01BD/KERNEL/EG/STABLE/F"
    spectrumFile="f.rc"
    change_branch

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    # sendInfo "starting build EmptyGlory-F Q . . ."

    build "DTCQ60Hz" "" "$chat_group_id" >/dev/null
    build "DTCQ65Hz" "" "$chat_group_id" >/dev/null
    build "DTCQ68Hz" "" "$chat_group_id" >/dev/null
    build "DTCQ71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build EmptyGlory-F Q done . . ."

    ## for pie
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    #FolderUpload="X01BD/KERNEL/EG/STABLE/F"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    # sendInfo "starting build EmptyGlory-F P . . ."

    build "DTCP60Hz" "" "$chat_group_id" >/dev/null
    build "DTCP65Hz" "" "$chat_group_id" >/dev/null
    build "DTCP68Hz" "" "$chat_group_id" >/dev/null
    build "DTCP71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build EmptyGlory-F P done . . ."

    clean_build

################################################################################################ EG M

    branch="eg/20200313/m"
    # folder="qk_normal"
    FolderUpload="X01BD/KERNEL/EG/STABLE/M"
    spectrumFile="m.rc"
    change_branch

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    # sendInfo "starting build EmptyGlory-M Q . . ."

    build "DTCQ60Hz" "" "$chat_group_id" >/dev/null
    build "DTCQ65Hz" "" "$chat_group_id" >/dev/null
    build "DTCQ68Hz" "" "$chat_group_id" >/dev/null
    build "DTCQ71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build EmptyGlory-M Q done . . ."

    ## for pie
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    #FolderUpload="X01BD/KERNEL/EG/STABLE/M"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    # sendInfo "starting build EmptyGlory-M P . . ."

    build "DTCP60Hz" "" "$chat_group_id" >/dev/null
    build "DTCP65Hz" "" "$chat_group_id" >/dev/null
    build "DTCP68Hz" "" "$chat_group_id" >/dev/null
    build "DTCP71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build EmptyGlory-M P done . . ."

    clean_build

################################################################################################ EG H

    branch="eg/20200313/h"
    FolderUpload="X01BD/KERNEL/EG/STABLE/H"
    spectrumFile="h.rc"
    change_branch

    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit
    MainCommit=$GetCommit
    chat_id="$chat_group_id"
    # sendInfo "starting build EmptyGlory-H Q . . ."

    build "DTCQ60Hz" "" "$chat_group_id" >/dev/null
    build "DTCQ65Hz" "" "$chat_group_id" >/dev/null
    build "DTCQ68Hz" "" "$chat_group_id" >/dev/null
    build "DTCQ71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build EmptyGlory-H Q done . . ."

    ## for pie
    git reset --hard $MainCommit
    git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
    git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

    # FolderUpload="X01BD/KERNEL/EG/STABLE/H"
    GetCommit=$(git log --pretty=format:'%h' -1)
    HeadCommit=$GetCommit

    # sendInfo "starting build EmptyGlory-H P . . ."

    build "DTCP60Hz" "" "$chat_group_id" >/dev/null
    build "DTCP65Hz" "" "$chat_group_id" >/dev/null
    build "DTCP68Hz" "" "$chat_group_id" >/dev/null
    build "DTCP71Hz" "" "$chat_group_id" >/dev/null

    # sendInfo "build EmptyGlory-H P done . . ."

    clean_build

cd ..
rm -rf ./$folder
# sendInfo "remove all kernels files on server done . . . "