#!/usr/bin/env bash
branch="qk/20200313/n"
folder="qk_normal"
FolderUpload="X01BD/KERNEL/QK/STABLE/N/$(date +"%Y-%m-%d")"
spectrumFile="vipn.rc"
. main.sh "get-kernel"

# GetREALlog="$(git log --pretty='format:%C(auto)%h : %s' -1)"
# Getlog="${GetREALlog/\&/"and"}"
# GetBranch=$(git rev-parse --abbrev-ref HEAD)
GetCommit=$(git log --pretty=format:'%h' -1)
HeadCommit=$GetCommit
MainCommit=$GetCommit

build "" "tele" "$chat_group_id"
makeZip "" ""
build "65Hz" "tele" "$chat_group_id"
makeZip "65Hz" ""
build "66Hz" "tele" "$chat_group_id"
makeZip "66Hz" ""
build "67Hz" "tele" "$chat_group_id"
makeZip "67Hz" ""
build "68Hz" "tele" "$chat_group_id"
makeZip "68Hz" ""
build "69Hz" "tele" "$chat_group_id"
makeZip "69Hz" ""
build "71Hz" "tele" "$chat_group_id"
makeZip "71Hz" ""

## for pie
git reset --hard $MainCommit
git cherry-pick 3f7999d7701391724d59ffb478b2f448a50c2172 babfe8f4448ebd39aaad806ae3eecd1e05960971
git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e

FolderUpload="X01BD/KERNEL/DC/STABLE/N/$(date +"%Y-%m-%d")"
GetCommit=$(git log --pretty=format:'%h' -1)
HeadCommit=$GetCommit

build "" "tele" "$chat_group_id"
makeZip "" ""
build "65Hz" "tele" "$chat_group_id"
makeZip "65Hz" ""
build "66Hz" "tele" "$chat_group_id"
makeZip "66Hz" ""
build "67Hz" "tele" "$chat_group_id"
makeZip "67Hz" ""
build "68Hz" "tele" "$chat_group_id"
makeZip "68Hz" ""
build "69Hz" "tele" "$chat_group_id"
makeZip "69Hz" ""
build "71Hz" "tele" "$chat_group_id"
makeZip "71Hz" ""

echo "done . . ."