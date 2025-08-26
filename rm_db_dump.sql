#!/bin/bash

# Delete old backups and archives
rm -rf /var/lib/pgbackrest/backup/bahmni-postgres/*
rm -rf /var/lib/pgbackrest/archive/bahmni-postgres/9.6-1/*
rm -rf /data/*
rm -rf /mymount/*

# Recreate necessary directories
mkdir -p /data/backup/
mkdir -p /data/Dumpfile/

