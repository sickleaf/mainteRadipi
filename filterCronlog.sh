#!/bin/bash -eu

filterJob=$1
filterNum=$2

filterTMP=/tmp/$$

if [ $# -ge 3 ]; then
	slackCh=$3
fi

maintePass=/home/radipi/repository/mainteRadipi
sendSlack=${maintePass}/sendStatustoSlack.sh

nowDate=`LANG=C; date '+%b %d %H:%M'` # Sep 12 23:42

cat /var/log/cron.log{.1,} | # check both cron.log.1 AND cron.log
sed -e 's/ \+/ /g' | # remove successive spaces
grep "${filterJob}" | # filter jobName
tail -"${filterNum}" | # filter last N log
awk -F'(' '{print $1, $3}' |  # extract TIME,JOB from cron.log
cut -d" " -f 1-3,6- | # remove "raspberrypi CRON [PID]:"
grep -v "${nowDate}" | # remove my own cron log
sed 's/.$//' > $filterTMP-cat  # remove last ')'

cat ${filterTMP}-cat

if [ ! -z "${slackCh}" ]; then
	cat ${filterTMP}-cat | ${sendSlack} ${slackCh}
fi

rm -f ${filterTMP}-*
