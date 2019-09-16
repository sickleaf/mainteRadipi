#!/bin/bash -eu

DFTMP=/tmp/$$
storageID=$1

bash -c 'df -h | grep -E "/$" | awk "{print  \"[systemStorage]\t\" \$(NF-1)   \" \" \$3 \"->\"  \$2  \"\t\t\" \$NF}"' > $DFTMP-system

bash -c 'df -h | grep -E "mnt" | awk "{print  \"[mountStorage]\t\" \$(NF-1)   \" \" \$3 \"->\"  \$2  \"\t\t\" \$NF}"' > $DFTMP-mount

usedStorage=`rclone size ${storageID}:/ | tail -1 | cut -d"(" -f1`
echo -e "[rcloneDrive]\t${usedStorage}" > $DFTMP-storage

cat $DFTMP-system
cat $DFTMP-mount
cat $DFTMP-storage

rm -f $DFTMP-*

