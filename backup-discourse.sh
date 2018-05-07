#!/bin/bash

set -e

temp_dir=$(mktemp -d)
pushd $temp_dir > /dev/null

for f in /var/docker-www/data/discourse/standalone/backups/default/*.gz; do
    z=$(basename $f)
    z=${z/.tar.gz/}
    mkdir $z
    tar xf $f -C $z
    gunzip $z/dump.sql.gz
done

find */ -type f | rev | sort | rev | tar cJf /var/docker-www/backups/discourse.tar.xz -T -

popd > /dev/null
rm -rf $temp_dir
