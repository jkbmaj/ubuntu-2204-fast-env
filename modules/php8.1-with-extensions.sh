#!/usr/bin/env bash

if ! which php8.1 > /dev/null; then
    apt install --yes --no-install-recommends php8.1 php8.1-imagick php8.1-readline php8.1-amqp php8.1-imap php8.1-redis\
        php8.1-apcu php8.1-intl php8.1-bcmath php8.1-ldap php8.1-bz2 php8.1-mailparse php8.1-soap php8.1-mbstring php8.1-cli \
        php8.1-sqlite3 php8.1-common php8.1-curl php8.1-mongodb php8.1-dev php8.1-mysql php8.1-oauth php8.1-uploadprogress \
        php8.1-odbc php8.1-uuid php8.1-fpm php8.1-opcache php8.1-xdebug php8.1-gd php8.1-pcov php8.1-xml php8.1-pgsql php8.1-xmlrpc \
        php8.1-xsl php8.1-gmp php8.1-gnupg php8.1-pspell php8.1-yaml php8.1-http php8.1-zip php8.1-igbinary php8.1-raphf
fi