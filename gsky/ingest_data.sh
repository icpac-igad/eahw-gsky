#!/bin/bash
set -xeu

export PATH="/gsky/bin:/gsky/share/mas:$PATH"
export SHARD_NAME=$1
export CRAWL_DIR=$2
export CRAWL_PATTERN=$3
export CRAWL_EXTRA_ARGS=${4:-}

export CRAWL_OUTPUT_DIR=/crawl_outputs
export CRAWL_CONC_LIMIT=2
export LD_LIBRARY_PATH="/usr/local/lib:${LD_LIBRARY_PATH:-}"

export PGUSER=postgres
export PGDATA=/pg_data
MEMCACHE_DEV_TCP_FILE=${MEMCACHE_DEV_TCP_FILE:=-""}

set +x
res=$(find "$CRAWL_DIR" -name "${CRAWL_PATTERN}")
if [ -z "$res" ]; then
  echo "No ${CRAWL_PATTERN} files under '$CRAWL_DIR'."
else
  set -x

  rm -rf $CRAWL_OUTPUT_DIR
  mkdir -p $CRAWL_OUTPUT_DIR

  /gsky/bin/gsky-crawl_pipeline.sh

  crawl_job_id="${CRAWL_DIR//[\/]/_}"

  (cd /gsky/share/mas && ./ingest_pipeline.sh $SHARD_NAME /crawl_outputs/${crawl_job_id}_gdal.tsv.gz)

  # flush memcache on each ingestion
  if [ ! -z "$MEMCACHE_DEV_TCP_FILE" ]; then
    echo flush_all > /dev/tcp/$MEMCACHE_DEV_TCP_FILE
  fi
fi
