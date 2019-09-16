#!/bin/bash -eu

tmp=/tmp/$$

slackChannel=$1
makeMsgScript=$2
sendMsgScript=sendStatustoSlack.sh

cmds=`echo "$*" | cut -d" " -f 2-`

cd $(dirname $0)

if [ -f ${makeMsgScript} ];then
	bash ${cmds} > ${tmp}-execLog
	cat ${tmp}-execLog | bash ${sendMsgScript} ${slackChannel}
fi

rm $tmp-*
