#!/usr/bin/env bash
# for update builder
# list branch
git checkout eg-f && git pull . master && \
git checkout eg-m && git pull . master && \
git checkout eg-h && git pull . master && \
git checkout qk-n && git pull . master && \
git checkout qk-l && git pull . master && \
git checkout qk-ul && git pull . master && \
git checkout private && git pull . master && \
git checkout private-oc && git pull . master && \
git checkout master

git branch -D eg-f eg-m eg-h
git branch -D qk-n qk-l qk-ul
git branch -D private private-oc

git checkout master && git checkout -b eg-f && \
git checkout master && git checkout -b eg-m && \
git checkout master && git checkout -b eg-h && \
git checkout master && git checkout -b qk-n && \
git checkout master && git checkout -b qk-l && \
git checkout master && git checkout -b qk-ul && \
git checkout master && git checkout -b private && \
git checkout master && git checkout -b private-oc && \
git checkout master

function update_file() {
    if [ ! -z "$1" ] && [ ! -z "$2" ] && [ ! -z "$3" ];then
        GetValue="$(cat "$3" | grep "$1")"
        GetPath=${3/"./"/"/"}
        [ "$GetValue" != "$2" ] && \
        sed -i "s/$1.*/$2/g" "$3"
        [ ! -z "$(git status | grep "modified" )" ] && \
        git add "$3" && \
        git commit -m "update builder $2"
    fi
}
git checkout eg-f && update_file '# source master.sh' "source eg-f.sh" "./.circleci/config.yml" && \
git checkout eg-m && update_file '# source master.sh' "source eg-m.sh" "./.circleci/config.yml" && \
git checkout eg-h && update_file '# source master.sh' "source eg-h.sh" "./.circleci/config.yml" && \
git checkout qk-n && update_file '# source master.sh' "source qk-n.sh" "./.circleci/config.yml" && \
git checkout qk-l && update_file '# source master.sh' "source qk-l.sh" "./.circleci/config.yml" && \
git checkout qk-ul && update_file '# source master.sh' "source qk-ul.sh" "./.circleci/config.yml" && \
git checkout private && update_file '# source master.sh' "source private.sh" "./.circleci/config.yml" && \
git checkout private-oc && update_file '# source master.sh' "source private-oc.sh" "./.circleci/config.yml" && \
git checkout master
