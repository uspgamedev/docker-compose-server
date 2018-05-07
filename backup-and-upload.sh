#!/bin/bash

set -e
dir=$(dirname "$(readlink -f "$0")")

bash $dir/backup-bd.sh
bash $dir/backup-discourse.sh

rsync -av --delete /var/docker-www/backups/database/ uspgamedev@shell.ime.usp.br:private/backups/database/

rsync -av --delete /var/docker-www/backups/discourse.tar.xz uspgamedev@shell.ime.usp.br:private/backups/discourse/

echo $dirname
