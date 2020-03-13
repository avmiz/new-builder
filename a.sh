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

build "" "tele" "$chat_group_id"