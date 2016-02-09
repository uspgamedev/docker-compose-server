# docker-compose-server

A docker-compose configuration file for the [USPGameDev](http://uspgamedev.org) site.

It is composed of a nginx front end that proxies a WordPress, a Mediawiki and a Simple Machines Forum, all backed by a MySQL database.
It also serves the static content, composed of project binaries and media.
The USPGameDev projects also have documentation generated and hosted here.

The HTTPS certificate is generated via the [Let's Encrypt](https://letsencrypt.org/) project.
