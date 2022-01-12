#!/bin/sh

set -e

echo todo fix run.sh

if [ "${SCHEDULE}" = "**None**" ]; then
  ruby /backup.rb
else
  echo "* * * * * ruby /backup.rb" > /etc/crontabs/root
  # echo "$SCHEDULE ruby /backup.rb" > /etc/crontabs/root
  crond -d 6 -f
fi
