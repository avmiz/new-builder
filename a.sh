#!/usr/bin/env bash
branch="qk/20200313/n"
folder="qk_normal"
# FolderUpload="X01BD/KERNEL/QK/STABLE/$(date +"%Y-%m-%d")"
spectrumFile="vipn.rc"
. main.sh "get-kernel"

# GetREALlog="$(git log --pretty='format:%C(auto)%h : %s' -1)"
# Getlog="${GetREALlog/\&/"and"}"
# GetBranch=$(git rev-parse --abbrev-ref HEAD)
GetCommit=$(git log --pretty=format:'%h' -1)
HeadCommit=$GetCommit
MainCommit=$GetCommit

build "" "tele" "$chat_group_id"
build "65Hz" "tele" "$chat_group_id"
build "71Hz" "tele" "$chat_group_id"

## for pie
git reset --hard $MainCommit
git cherry-pick 3f7999d7701391724d59ffb478b2f448a50c2172 babfe8f4448ebd39aaad806ae3eecd1e05960971
git revert ab24c40ba48e47f4543ac9afa9763112a7d3d68e

# FolderUpload="X01BD/KERNEL/DC/STABLE/$(date +"%Y-%m-%d")"
GetCommit=$(git log --pretty=format:'%h' -1)
HeadCommit=$GetCommit

build "" "tele" "$chat_group_id"
build "65Hz" "tele" "$chat_group_id"
build "71Hz" "tele" "$chat_group_id"