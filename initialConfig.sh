#!/bin/sh

scriptDir=$(cd $(dirname $0); pwd);

configFile=${scriptDir}/systemConfig

if [ ! -f ${configFile} ]; then
        echo "mail=" > ${configFile}
fi

echo "systemConfig: ${configFile}"

read -p "[1]mail=" mail
sed -i "/^mail=/s/mail=.*/mail=${mail}/g" ${configFile}
