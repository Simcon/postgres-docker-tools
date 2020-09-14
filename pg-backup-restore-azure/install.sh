#! /bin/sh

# exit if a command fails
set -e

apt-get update
apt-get install -y wget apt-transport-https

wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | apt-key add -
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'

apt-get update

# install pg_dump
apt-get install -y postgresql-12

# install curl
apt-get install -y --no-install-recommends curl

#install Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# install go-cron
curl -L --insecure https://github.com/odise/go-cron/releases/download/v0.0.6/go-cron-linux.gz | zcat > /usr/local/bin/go-cron
chmod u+x /usr/local/bin/go-cron

# cleanup
rm -rf /var/cache/apt-get/*
