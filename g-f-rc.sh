#!/usr/bin/env bash
branch="eg/20200313/f-rc"
folder="qk_normal"
FolderUpload="X01BD/KERNEL/EG/Release-Candidate/F"
spectrumFile="vipn.rc"
. main.sh "get-kernel"

GetCommit=$(git log --pretty=format:'%h' -1)
HeadCommit=$GetCommit
MainCommit=$GetCommit
chat_id="$chat_group_id"
sendInfo "starting build EmptyGlory-F Q RC . . ."

build "Q60Hz" "" "$chat_group_id"
build "Q65Hz" "" "$chat_group_id"
build "Q66Hz" "" "$chat_group_id"
build "Q67Hz" "" "$chat_group_id"
build "Q68Hz" "" "$chat_group_id"
build "Q69Hz" "" "$chat_group_id"
build "Q71Hz" "" "$chat_group_id"

sendInfo "build EmptyGlory-F Q RC done . . ."

## for pie
git reset --hard $MainCommit
git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

FolderUpload="X01BD/KERNEL/DC/STABLE/N"
GetCommit=$(git log --pretty=format:'%h' -1)
HeadCommit=$GetCommit

sendInfo "starting build EmptyGlory-F P RC . . ."

build "P60Hz" "" "$chat_group_id"
build "P65Hz" "" "$chat_group_id"
build "P66Hz" "" "$chat_group_id"
build "P67Hz" "" "$chat_group_id"
build "P68Hz" "" "$chat_group_id"
build "P69Hz" "" "$chat_group_id"
build "P71Hz" "" "$chat_group_id"

sendInfo "build EmptyGlory-F P RC done . . ."

git reset --hard $MainCommit
git cherry-pick 92f5fd7f8609a42fd6c381b5a864bd88e142f534 4f79d5e3ded55f178b1b4494efe947129268fc60
FolderUpload="X01BD/KERNEL/QK/STABLE/N-SAR"
GetCommit=$(git log --pretty=format:'%h' -1)
HeadCommit=$GetCommit

sendInfo "starting build EmptyGlory-F Q SAR RC . . ."

build "QSAR60Hz" "" "$chat_group_id"
build "QSAR65Hz" "" "$chat_group_id"
build "QSAR66Hz" "" "$chat_group_id"
build "QSAR67Hz" "" "$chat_group_id"
build "QSAR68Hz" "" "$chat_group_id"
build "QSAR69Hz" "" "$chat_group_id"
build "QSAR71Hz" "" "$chat_group_id"

sendInfo "build EmptyGlory-F Q SAR RC done . . ."