#!/bin/bash

set -e

echo Will renew certificates
docker run --rm --name certbot \
            -v "/etc/letsencrypt:/etc/letsencrypt" \
            -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
            -v "/var/docker-www/acme-challenge:/var/docker-www/acme-challenge" \
            quay.io/letsencrypt/letsencrypt:latest renew \
                --webroot-path /var/docker-www/acme-challenge
pkill --signal SIGHUP nginx
