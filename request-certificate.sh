#!/bin/bash

docker run --rm --name certbot \
    -v "/etc/letsencrypt:/etc/letsencrypt" \
    -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
    -v "/var/docker-www/acme-challenge:/var/docker-www/acme-challenge" \
    certbot/certbot:latest \
        certonly \
        --webroot --webroot-path /var/docker-www/acme-challenge \
        -d usp.game.dev.br \
        -d forum.usp.game.dev.br \
        --expand
