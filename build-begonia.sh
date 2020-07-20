
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
git branch -D bego-qk-n bego-qk-l bego-qk-n-rc bego-qk-l-rc
git branch -D bego bego-oc bego-rc bego-oc-rc
git checkout master && git checkout -b bego && \
git checkout master && git checkout -b bego-rc && \
git checkout master && git checkout -b bego-oc && \
git checkout master && git checkout -b bego-oc-rc && \
git checkout master && git checkout -b bego-qk-n && \
git checkout master && git checkout -b bego-qk-n-rc && \
git checkout master && git checkout -b bego-qk-l && \
git checkout master && git checkout -b bego-qk-l-rc && \
git checkout bego && update_file '# source master.sh' "source bego.sh" "./.circleci/config.yml" && \
git checkout bego-oc && update_file '# source master.sh' "source bego-oc.sh" "./.circleci/config.yml" && \
git checkout bego-rc && update_file '# source master.sh' "source bego-rc.sh" "./.circleci/config.yml" && \
git checkout bego-oc-rc && update_file '# source master.sh' "source bego-oc-rc.sh" "./.circleci/config.yml" && \
git checkout bego-qk-n && update_file '# source master.sh' "source bego-qk-n.sh" "./.circleci/config.yml" && \
git checkout bego-qk-n-rc && update_file '# source master.sh' "source bego-qk-n-rc.sh" "./.circleci/config.yml" && \
git checkout bego-qk-l && update_file '# source master.sh' "source bego-qk-l.sh" "./.circleci/config.yml" && \
git checkout bego-qk-l-rc && update_file '# source master.sh' "source bego-qk-l-rc.sh" "./.circleci/config.yml" && \
git checkout master
if [ ! -z "$1" ] && [ "$1" == "rc" ];then
    git push origin bego-rc bego-oc-rc bego-qk-n-rc bego-qk-l-rc -f
else
    git push origin bego bego-oc bego-qk-n bego-qk-l -f
fi