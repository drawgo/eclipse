#!/usr/bin/env bash

# Connect database
running=`docker ps --format '{{.Names}}' | grep mysqlscript | wc -l`
dbRunning=`docker ps --format '{{.Names}}' | grep eclipseDB-MYSQL | wc -l`

if [ $dbRunning == "1" ]; then
  if [ $running != "1" ]; then
    docker run -d --rm --name mysqlscript --link eclipseDB-MYSQL:mysql -e MYSQL_RANDOM_ROOT_PASSWORD=true -v $(PWD)/scripts:/tmp/scripts mysql:5.7.28
    docker exec -it mysqlscript sh -c 'mysql -h eclipseDB-MYSQL -P 3306 -u root -peclipsesenha < /tmp/scripts/init_db.sql'
    docker exec -it mysqlscript sh -c 'mysql -h eclipseDB-MYSQL -P 3306 -u root -peclipsesenha < /tmp/scripts/eclipse.sql'
    docker exec -it mysqlscript sh -c 'mysql -h eclipseDB-MYSQL -P 3306 -u root -peclipsesenha < /tmp/scripts/confirm_init_db.sql'
    docker stop mysqlscript
  else
    echo "Container stopped"
  fi
else
  echo "DB container not started - run startMySqlDB.sh scritp to start"
fi


# docker run --rm -it --name mysqlscript --link eclipseDB-MYSQL:mysql mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"eclipsesenha"'

# docker cp init_db.sql mysqlscript:/tmp/.
# docker cp eclipse.sql mysqlscript:/tmp/.


# source /tmp/init_db.sql
# source /tmp/eclipse.sql