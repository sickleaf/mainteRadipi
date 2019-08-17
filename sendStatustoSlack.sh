#!/bin/bash -eu

# http://vdeep.net/shellscript-slack

MSGFILE=$(mktemp -t webhookXXXX)
trap "rm ${MSGFILE}" 0

source "$(dirname $0)/slackWebhookInfo"

if [ -p /dev/stdin ]; then
	cat - | tr '\n' '\\' | sed 's/\\/\\n/g' > ${MSGFILE}
else
	echo "stdin is blank"
	exit 1
fi


MSG='```'$(cat ${MSGFILE})'```'

payload="payload={
	\"channel\": \"${CHANNEL}\",
	\"username\": \"${BOTNAME}\",
	\"text\": \"${HEAD}${MSG}\"
}"

curl -s -S -X POST --data-urlencode "${payload}" ${URL} > /dev/null
