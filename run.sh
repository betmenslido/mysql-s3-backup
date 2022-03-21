#!/bin/sh

set -e

if [ "${SCHEDULE}" = "**None**" ]; then
  ruby /app/run_backup.rb
else
  echo "$SCHEDULE cd /app && ruby run_backup.rb" > /etc/crontabs/root

  echo "--- Using: /etc/crontabs/root"
  cat /etc/crontabs/root
  echo "---"

  # -f      Foreground
  # -d N    Set log level, log to stderr
  crond -d 6 -f
fi
