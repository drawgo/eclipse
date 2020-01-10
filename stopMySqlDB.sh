#!/usr/bin/env bash

# stop database
running=`docker ps --format '{{.Names}}' | grep eclipseDB-MYSQL | wc -l`

if [ $running == "1" ]; then
    docker stop eclipseDB-MYSQL
else
    echo "Container already stopped"
fi