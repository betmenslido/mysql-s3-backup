#!/bin/sh

set -e

if [ "${SCHEDULE}" = "**None**" ]; then
  cd /app && ruby run.rb
else
  echo "$SCHEDULE cd /app && ruby run.rb" > /etc/crontabs/root

  echo "--- Using: /etc/crontabs/root"
  cat /etc/crontabs/root
  echo "---"

  # -f      Foreground
  # -d N    Set log level, log to stderr
  crond -d 6 -f
fi
