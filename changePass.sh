#!/bin/sh

scriptDir=$(cd $(dirname $0); pwd);

authDir=${scriptDir}/auth

seckey=${authDir}/seckey
cipher=${authDir}/cipher
tmpPwd=${authDir}/pass.txt

configFile=${scriptDir}/systemConfig

rm -f ${seckey} ${cipher}

if [ ! -f ${configFile} ]; then
        echo "<< ${configFile} not found. run initialConfig.sh >>"
        exit
fi

echo "mail:`cat ${configFile} | grep "mail="`"

read -p "password:" pass

mkdir -p ${authDir}

echo $pass > ${tmpPwd}

cd ${authDir}

ssh-keygen -m PEM -t rsa -f ${seckey} -q -P  ""
openssl rsautl -encrypt -inkey ${seckey} -in ${tmpPwd} > ${cipher}
rm ${tmpPwd}
