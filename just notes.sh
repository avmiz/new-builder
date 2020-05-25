#!/usr/bin/env bash
# for update builder
# list branch
git checkout eg-f && git pull . master && \
git checkout eg-f-rc && git pull . master && \
git checkout eg-m && git pull . master && \
git checkout eg-m-rc && git pull . master && \
git checkout eg-h && git pull . master && \
git checkout eg-h-rc && git pull . master && \
git checkout qk-n && git pull . master && \
git checkout qk-n-rc && git pull . master && \
git checkout qk-l && git pull . master && \
git checkout qk-l-rc && git pull . master && \
git checkout qk-ul && git pull . master && \
git checkout qk-ul-rc && git pull . master && \
git checkout private && git pull . master && \
git checkout private-rc && git pull . master && \
git checkout private-oc-rc && git pull . master && \
git checkout private-oc && git pull . master && \
git checkout master

git branch -D eg-f eg-m eg-h eg-f-rc eg-m-rc eg-h-rc
git branch -D qk-n qk-l qk-ul qk-n-rc qk-l-rc qk-ul-rc
git branch -D private private-oc private-rc private-oc-rc

git checkout master && git checkout -b eg-f && \
git checkout master && git checkout -b eg-f-rc && \
git checkout master && git checkout -b eg-m && \
git checkout master && git checkout -b eg-m-rc && \
git checkout master && git checkout -b eg-h && \
git checkout master && git checkout -b eg-h-rc && \
git checkout master && git checkout -b qk-n && \
git checkout master && git checkout -b qk-n-rc && \
git checkout master && git checkout -b qk-l && \
git checkout master && git checkout -b qk-l-rc && \
git checkout master && git checkout -b qk-ul && \
git checkout master && git checkout -b qk-ul-rc && \
git checkout master && git checkout -b private && \
git checkout master && git checkout -b private-rc && \
git checkout master && git checkout -b private-oc && \
git checkout master && git checkout -b private-oc-rc && \
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
git checkout eg-f-rc && update_file '# source master.sh' "source eg-f-rc.sh" "./.circleci/config.yml" && \
git checkout eg-m && update_file '# source master.sh' "source eg-m.sh" "./.circleci/config.yml" && \
git checkout eg-m-rc && update_file '# source master.sh' "source eg-m-rc.sh" "./.circleci/config.yml" && \
git checkout eg-h && update_file '# source master.sh' "source eg-h.sh" "./.circleci/config.yml" && \
git checkout eg-h-rc && update_file '# source master.sh' "source eg-h-rc.sh" "./.circleci/config.yml" && \
git checkout qk-n && update_file '# source master.sh' "source qk-n.sh" "./.circleci/config.yml" && \
git checkout qk-n-rc && update_file '# source master.sh' "source qk-n-rc.sh" "./.circleci/config.yml" && \
git checkout qk-l && update_file '# source master.sh' "source qk-l.sh" "./.circleci/config.yml" && \
git checkout qk-l-rc && update_file '# source master.sh' "source qk-l-rc.sh" "./.circleci/config.yml" && \
git checkout qk-ul && update_file '# source master.sh' "source qk-ul.sh" "./.circleci/config.yml" && \
git checkout qk-ul-rc && update_file '# source master.sh' "source qk-ul-rc.sh" "./.circleci/config.yml" && \
git checkout private && update_file '# source master.sh' "source private.sh" "./.circleci/config.yml" && \
git checkout private-rc && update_file '# source master.sh' "source private-rc.sh" "./.circleci/config.yml" && \
git checkout private-oc && update_file '# source master.sh' "source private-oc.sh" "./.circleci/config.yml" && \
git checkout private-oc-rc && update_file '# source master.sh' "source private-oc-rc.sh" "./.circleci/config.yml" && \
git checkout master
