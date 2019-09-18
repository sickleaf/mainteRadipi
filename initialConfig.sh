#!/bin/sh

scriptDir=$(cd $(dirname $0); pwd);

configFile=${scriptDir}/systemConfig

if [ ! -f ${configFile} ]; then
        echo "mail=" >> ${configFile}
        echo "playerURL=http://radiko.jp/apps/js/flash/myplayer-release.swf" >> ${configFile}
        echo "loginURL=https://radiko.jp/ap/member/login/login" >> ${configFile}
fi

echo "systemConfig: ${configFile}"

read -p "[1]mail=" mail
sed -i "/^mail=/s/mail=.*/mail=${mail}/g" ${configFile}
