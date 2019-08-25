#!/bin/bash -eu

tmp=/tmp/$$

makeMsgScript=$1
sendMsgScript=sendStatustoSlack.sh

cd $(dirname $0)

if [ -f ${makeMsgScript} ];then
	bash ${makeMsgScript} > ${tmp}-execLog
	cat ${tmp}-execLog | bash ${sendMsgScript}
fi

rm $tmp-*
