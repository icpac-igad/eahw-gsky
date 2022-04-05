#!/bin/bash
set -xeu

export LD_LIBRARY_PATH="/usr/local/lib:${LD_LIBRARY_PATH:-}"

export PGUSER=${PGUSER:-postgres}
export PGDATA=${PGDATA:-/pg_data}

MEMCACHE_URI=${MEMCACHE_URI:=-""}
MAS_DB_POOL_SIZE=${MAS_DB_POOL_SIZE:-2}

WEBHOOK_SECRET=${WEBHOOK_SECRET:-""}
WEBHOOK_ENABLED=${WEBHOOK_ENABLED:-false}

GSKY_WMS_GEOMS_FILE=${GSKY_WMS_GEOMS_FILE:-""}

masapi_port=8888
rpc_port=6000
ows_port=8080

rm -rf /var/run/postgresql
mkdir -p /var/run/postgresql

su -p -c "pg_ctl -w start" -l "$PGUSER"

# masapi requires postgresql unix domain socket under /var/run
ln -s /tmp/.s.PGSQL.5432 /var/run/postgresql/.s.PGSQL.5432

bash /ingest.sh

./gsky/bin/masapi -port $masapi_port -pool $MAS_DB_POOL_SIZE -memcache $MEMCACHE_URI > masapi_output.log 2>&1 &

n_cores=$(grep '^cpu\s*cores' /proc/cpuinfo|uniq|awk '{print $4}')
if [[ ! "$n_cores" =~ ^[0-9]+$ ]]
then
  echo 'cannot determine number of cpu cores, using default value 1'
  n_cores=1
elif [ $n_cores -lt 2 ]
then
  n_cores=1
fi

./gsky/bin/gsky-rpc -p $rpc_port -n $n_cores > rpc_output.log 2>&1 &
sleep 1

./gsky/bin/gsky-ows -p $ows_port -geom_file $GSKY_WMS_GEOMS_FILE -v  &
sleep 0.5


set +x
echo
echo
echo '=========================================================='
echo 'Welcome to GSKY Docker'
echo
echo "GSKY WMS/WCS end point:  http://127.0.0.1:$ows_port/ows"
echo "MAS API end point:       http://127.0.0.1:$masapi_port"
echo
echo '=========================================================='

if [ "$WEBHOOK_ENABLED" = true ] && [ -n "$WEBHOOK_SECRET" ]
then
  # Replace secret key for webhooks from env
  sed -i 's/\[WEBHOOK_SECRET\]/'${WEBHOOK_SECRET}'/' /hooks.conf
  ./webhook -hooks /hooks.conf -verbose

  echo '=========================================================='
  echo "Webhooks end point:       http://127.0.0.1:9000"
  echo '=========================================================='

else
  echo "Webhooks not enabled"
fi

wait
