#!/bin/bash

docker run --rm --name certbot \
    -v "/etc/letsencrypt:/etc/letsencrypt" \
    -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
    -v "/var/docker-www/acme-challenge:/var/docker-www/acme-challenge" \
    certbot/certbot:latest \
        certonly \
        --webroot --webroot-path /var/docker-www/acme-challenge \
        -d uspgamedev.org \
        -d www.uspgamedev.org \
        -d git.uspgamedev.org \
        -d forum.uspgamedev.org \
        -d blog.uspgamedev.org \
        -d chat.uspgamedev.org \
        --expand
