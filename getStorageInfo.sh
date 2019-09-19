#!/bin/bash

DFTMP=/tmp/$$

if [ $# -ge 1 ]; then
	storageID=$1
	slackCh=$2
fi

maintePass=/home/radipi/repository/mainteRadipi
sendSlack=${maintePass}/sendStatustoSlack.sh

bash -c 'df -h | grep -E "/$" | awk "{print  \"[systemStorage]\t\" \$(NF-1)   \" \" \$3 \"->\"  \$2  \"\t\t\" \$NF}"' > $DFTMP-system

bash -c 'df -h | grep -E "mnt" | awk "{print  \"[mountStorage]\t\" \$(NF-1)   \" \" \$3 \"->\"  \$2  \"\t\t\" \$NF}"' > $DFTMP-mount

usedStorage=`rclone size ${storageID}:/ | tail -1 | cut -d"(" -f1`
echo -e "[rcloneDrive]\t${usedStorage}" > $DFTMP-storage

cat $DFTMP-system
cat $DFTMP-mount
cat $DFTMP-storage

if [ ! -z "${slackCh}" ]; then
	cat $DFTMP-system $DFTMP-mount $DFTMP-storage | ${sendSlack} ${slackCh}
fi

rm -f $DFTMP-*
