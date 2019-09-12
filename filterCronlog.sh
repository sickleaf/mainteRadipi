#!/bin/bash -eu

filterJob=$1
filterNum=$2

cat /var/log/cron.log | 
grep " ${filterJob}" | # filter jobName
tail -"${filterNum}" | # filter last N log
awk -F'(' '{print $1, $3}' |  # extract TIME,JOB from cron.log
cut -d" " -f 1-3,6- | # remove "raspberrypi CRON [PID]:"
sed 's/.$//'  # remove last ')'

