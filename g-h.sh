#!/usr/bin/env bash
branch="eg/20200313/h"
folder="qk_normal"
FolderUpload="X01BD/KERNEL/EG/STABLE/H"
spectrumFile="h.rc"
. main.sh "get-kernel"

GetCommit=$(git log --pretty=format:'%h' -1)
HeadCommit=$GetCommit
MainCommit=$GetCommit
chat_id="$chat_group_id"
sendInfo "starting build EmptyGlory-H Q . . ."

build "Q60Hz" "" "$chat_group_id"
build "Q65Hz" "" "$chat_group_id"
build "Q66Hz" "" "$chat_group_id"
build "Q67Hz" "" "$chat_group_id"
build "Q68Hz" "" "$chat_group_id"
build "Q69Hz" "" "$chat_group_id"
build "Q71Hz" "" "$chat_group_id"

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
build "P65Hz" "" "$chat_group_id"
build "P66Hz" "" "$chat_group_id"
build "P67Hz" "" "$chat_group_id"
build "P68Hz" "" "$chat_group_id"
build "P69Hz" "" "$chat_group_id"
build "P71Hz" "" "$chat_group_id"

sendInfo "build EmptyGlory-H P done . . ."

git reset --hard $MainCommit
git cherry-pick 92f5fd7f8609a42fd6c381b5a864bd88e142f534 4f79d5e3ded55f178b1b4494efe947129268fc60
# FolderUpload="X01BD/KERNEL/EG/STABLE/H"
GetCommit=$(git log --pretty=format:'%h' -1)
HeadCommit=$GetCommit

sendInfo "starting build EmptyGlory-H Q SAR . . ."

build "QSAR60Hz" "" "$chat_group_id"
build "QSAR65Hz" "" "$chat_group_id"
build "QSAR66Hz" "" "$chat_group_id"
build "QSAR67Hz" "" "$chat_group_id"
build "QSAR68Hz" "" "$chat_group_id"
build "QSAR69Hz" "" "$chat_group_id"
build "QSAR71Hz" "" "$chat_group_id"

sendInfo "build EmptyGlory-H Q SAR done . . ."