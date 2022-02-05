#!/bin/sh

set -e

echo todo fix run.sh

if [ "${SCHEDULE}" = "**None**" ]; then
  ruby /app/backup.rb
else
  echo "* * * * * ruby /app/backup.rb" > /etc/crontabs/root
  # echo "$SCHEDULE ruby /app/backup.rb" > /etc/crontabs/root
  crond -d 6 -f
fi
