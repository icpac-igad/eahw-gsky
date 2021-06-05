#!/bin/bash

crawl_dir=$1

docker exec gsky_server /ingest_prod_data.sh $crawl_dir

exit 0