if [ ! -z "$1" ] && [ "$1" == "rc" ];then
    git push origin bego-rc bego-oc-rc bego-qk-n-rc bego-qk-l-rc -f
else
    git push origin bego bego-oc bego-qk-n bego-qk-l -f
fi