#!/usr/bin/env bash
branch="qk/20200313/n"
folder="qk_normal"
FolderUpload="X01BD/KERNEL/QK/STABLE/L"
spectrumFile="vipn.rc"
. main.sh "get-kernel"

GetCommit=$(git log --pretty=format:'%h' -1)
HeadCommit=$GetCommit
MainCommit=$GetCommit
chat_id="$chat_group_id"
sendInfo "starting build QuantumKiller-L . . ."

build "" "" "$chat_group_id"
build "65Hz" "" "$chat_group_id"
build "66Hz" "" "$chat_group_id"
build "67Hz" "" "$chat_group_id"
build "68Hz" "" "$chat_group_id"
build "69Hz" "" "$chat_group_id"
build "71Hz" "" "$chat_group_id"

sendInfo "build QuantumKiller-L done . . ."

## for pie
git reset --hard $MainCommit
git cherry-pick 6471f35a09731d1cefbca7b119d6e5609abbf8ed ee9fb5762bbf7bc5650bd0a1adadf26e7299aa4c
git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e --no-commit
git commit -s -m "revert: ab24c40ba48e47f4543ac9afa9763112a7d3d68e"

FolderUpload="X01BD/KERNEL/DC/STABLE/L"
GetCommit=$(git log --pretty=format:'%h' -1)
HeadCommit=$GetCommit

sendInfo "starting build DeadlyCute-L . . ."

build "" "" "$chat_group_id"
build "65Hz" "" "$chat_group_id"
build "66Hz" "" "$chat_group_id"
build "67Hz" "" "$chat_group_id"
build "68Hz" "" "$chat_group_id"
build "69Hz" "" "$chat_group_id"
build "71Hz" "" "$chat_group_id"

sendInfo "build DeadlyCute-L done . . ."

git reset --hard $MainCommit
git cherry-pick 6471f35a09731d1cefbca7b119d6e5609abbf8ed 61ca8f4b2360e38a43bc562de1740e8b612c3941 92f5fd7f8609a42fd6c381b5a864bd88e142f534 4f79d5e3ded55f178b1b4494efe947129268fc60
FolderUpload="X01BD/KERNEL/QK/STABLE/L-SAR"
GetCommit=$(git log --pretty=format:'%h' -1)
HeadCommit=$GetCommit

sendInfo "starting build QuantumKiller-L-SAR . . ."

build "" "" "$chat_group_id"
build "65Hz" "" "$chat_group_id"
build "66Hz" "" "$chat_group_id"
build "67Hz" "" "$chat_group_id"
build "68Hz" "" "$chat_group_id"
build "69Hz" "" "$chat_group_id"
build "71Hz" "" "$chat_group_id"

sendInfo "build QuantumKiller-L-SAR done . . ."