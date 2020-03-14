#!/usr/bin/env bash
branch="qk/20200313/n"
folder="qk_normal"
FolderUpload="X01BD/KERNEL/QK/STABLE/N"
spectrumFile="vipn.rc"
. main.sh "get-kernel"

GetCommit=$(git log --pretty=format:'%h' -1)
HeadCommit=$GetCommit
MainCommit=$GetCommit

sendInfo "starting build QuantumKiller-N . . ."

build "" "" "$chat_group_id"
build "65Hz" "" "$chat_group_id"
build "66Hz" "" "$chat_group_id"
build "67Hz" "" "$chat_group_id"
build "68Hz" "" "$chat_group_id"
build "69Hz" "" "$chat_group_id"
build "71Hz" "" "$chat_group_id"

sendInfo "build QuantumKiller-N done . . ."

## for pie
git reset --hard $MainCommit
git cherry-pick 3f7999d7701391724d59ffb478b2f448a50c2172 babfe8f4448ebd39aaad806ae3eecd1e05960971
git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e

FolderUpload="X01BD/KERNEL/DC/STABLE/N"
GetCommit=$(git log --pretty=format:'%h' -1)
HeadCommit=$GetCommit

sendInfo "starting build DeadlyCute-N . . ."

build "" "" "$chat_group_id"
build "65Hz" "" "$chat_group_id"
build "66Hz" "" "$chat_group_id"
build "67Hz" "" "$chat_group_id"
build "68Hz" "" "$chat_group_id"
build "69Hz" "" "$chat_group_id"
build "71Hz" "" "$chat_group_id"

sendInfo "build DeadlyCute-N done . . ."

git reset --hard $MainCommit
git cherry-pick 3f7999d7701391724d59ffb478b2f448a50c2172 823eabfeb72cb96c210fe083008e878b3d7f6b4f 92f5fd7f8609a42fd6c381b5a864bd88e142f534 4f79d5e3ded55f178b1b4494efe947129268fc60
FolderUpload="X01BD/KERNEL/QK/STABLE/N-SAR"
GetCommit=$(git log --pretty=format:'%h' -1)
HeadCommit=$GetCommit

sendInfo "starting build QuantumKiller-N-SAR . . ."

build "" "" "$chat_group_id"
build "65Hz" "" "$chat_group_id"
build "66Hz" "" "$chat_group_id"
build "67Hz" "" "$chat_group_id"
build "68Hz" "" "$chat_group_id"
build "69Hz" "" "$chat_group_id"
build "71Hz" "" "$chat_group_id"

sendInfo "build QuantumKiller-N-SAR done . . ."