#!/usr/bin/env bash

# Create directory for mysql volume
if [ ! -d ".mysql" ] 
then
    mkdir .mysql
fi

# start database
running=`docker ps --format '{{.Names}}' | grep eclipseDB-MYSQL | wc -l`

if [ $running == "1" ]; then
  echo "Container already started"
else
    docker run --rm -p 3306:3306 --name eclipseDB-MYSQL -v $(PWD)/.mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=eclipsesenha -d  mysql:5.7.28
fi