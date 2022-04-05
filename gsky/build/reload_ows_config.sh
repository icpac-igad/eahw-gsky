#!/bin/bash
set -xeu

pid=$(ps aux |grep ows| awk 'NR==1{print $2}')

if [[ "" !=  "$pid" ]]; then
  echo "SIGHUP $pid"
  kill -1 $pid
fi