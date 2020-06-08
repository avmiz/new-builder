#!/usr/bin/env bash
# for update builder
# list branch
git branch -D eg-f eg-m eg-h
git branch -D qk-n qk-l qk-ul
git branch -D private private-oc
git branch -D bego bego-oc bego-rc bego-oc-rc

git checkout master && git checkout -b eg-f && \
git checkout master && git checkout -b eg-m && \
git checkout master && git checkout -b eg-h && \
git checkout master && git checkout -b qk-n && \
git checkout master && git checkout -b qk-l && \
git checkout master && git checkout -b qk-ul && \
git checkout master && git checkout -b private && \
git checkout master && git checkout -b private-oc && \
git checkout master && git checkout -b bego && \
git checkout master && git checkout -b bego-rc && \
git checkout master && git checkout -b bego-oc && \
git checkout master && git checkout -b bego-oc-rc && \
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
git checkout bego && update_file '# source master.sh' "source bego.sh" "./.circleci/config.yml" && \
git checkout bego-oc && update_file '# source master.sh' "source bego-oc.sh" "./.circleci/config.yml" && \
git checkout bego-rc && update_file '# source master.sh' "source bego-rc.sh" "./.circleci/config.yml" && \
git checkout bego-oc-rc && update_file '# source master.sh' "source bego-oc-rc.sh" "./.circleci/config.yml" && \
git checkout master
