#!/usr/bin/env bash

# Connect database
running=`docker ps --format '{{.Names}}' | grep eclipseDB-MYSQL | wc -l`

if [ $running == "1" ]; then
  docker run --rm -it --link eclipseDB-MYSQL:mysql mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"eclipsesenha"'
else
  echo "Container stopped"
fi