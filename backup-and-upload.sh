#!/bin/bash

set -e
dir=$(dirname "$(readlink -f "$0")")

bash $dir/backup-bd.sh

# Send only the latest backups to the server, but keep all old copies locally
rm -rf /var/docker-www/backups/database-latest/
mkdir -p /var/docker-www/backups/database-latest/
find /var/docker-www/backups/database/ -maxdepth 1 -type f -print0 \
     | xargs -0 stat --printf "%Y\t%n\n" \
     | sort -n \
     | tail -n 10 \
     | cut -f 2 \
     | xargs cp -a -t /var/docker-www/backups/database-latest/

bash $dir/backup-discourse.sh

rsync -av --delete /var/docker-www/backups/database-latest/ uspgamedev@shell.ime.usp.br:private/backups/database/
rsync -av --delete /var/docker-www/backups/discourse.tar.xz uspgamedev@shell.ime.usp.br:private/backups/discourse/

echo $dirname
