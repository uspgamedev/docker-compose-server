#!/bin/bash

# database
docker run --rm -v /var/docker-www/config/mysqldump-my.cnf:/root/.my.cnf:ro --network uspgamedev_default mysql mysqldump --all-databases -h db > /var/docker-www/backups/database/dump_mysql_$(date +%d-%m-%Y"_"%H_%M_%S).sql
su postgres -c pg_dumpall > /var/docker-www/backups/database/dump_postgre_$(date +%d-%m-%Y"_"%H_%M_%S).sql
rsync -av /var/docker-www/backups/database/ uspgamedev@shell.ime.usp.br:private/backups/database/

# discourse backups
rsync -av /var/docker-www/data/discourse/standalone/backups/default/ uspgamedev@shell.ime.usp.br:private/backups/discourse
