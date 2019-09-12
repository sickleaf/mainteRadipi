#!/bin/bash -eu

tmp=/tmp/$$

makeMsgScript=$1
sendMsgScript=sendStatustoSlack.sh

cmds=`echo "$*"`

cd $(dirname $0)

if [ -f ${makeMsgScript} ];then
	bash ${cmds} > ${tmp}-execLog
	cat ${tmp}-execLog | bash ${sendMsgScript}
fi

rm $tmp-*
