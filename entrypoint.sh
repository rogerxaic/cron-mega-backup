#!/bin/bash

if [[ -z "${MEGA_SESSION}" ]]; then
  if [[ -z "${MEGA_EMAIL}" ]] || [[ -z "${MEGA_PASSWORD}" ]] ; then
    exit -1;
  else 
    mega-login $MEGA_EMAIL $MEGA_PASSWORD
  fi
else
  mega-login $MEGA_SESSION
fi

echo "Docker container has been started"

declare -p | grep -Ev 'BASHOPTS|BASH_VERSINFO|EUID|PPID|SHELLOPTS|UID' > /container.env

echo "SHELL=/bin/bash
BASH_ENV=/container.env
${CRON_SCHEDULE} /backup.sh >> /var/log/cron.log 2>&1
" > scheduler.txt

crontab scheduler.txt
cron -f
