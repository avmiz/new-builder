. ./just-notes.sh
if [ ! -z "$1" ] && [ "$1" == "rc" ];then
    git push neetroid eg-f-rc eg-m-rc eg-h-rc private-oc-rc -f && \
    git push bitbucket -f qk-n-rc qk-l-rc qk-ul-rc private-rc
else
    git push neetroid eg-f eg-m eg-h private-oc -f && \
    git push bitbucket -f qk-n qk-l qk-ul private
fi