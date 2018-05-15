#!/bin/bash

docker run --rm -v /var/docker-www/config/mysqldump-my.cnf:/root/.my.cnf:ro --network uspgamedev_default mysql mysqldump --all-databases -h db \
    | gzip --rsyncable > /var/docker-www/backups/database/dump_mysql_$(date +%d-%m-%Y"_"%H_%M_%S).sql.gz
su postgres -c pg_dumpall \
    | gzip --rsyncable > /var/docker-www/backups/database/dump_postgre_$(date +%d-%m-%Y"_"%H_%M_%S).sql.gz

