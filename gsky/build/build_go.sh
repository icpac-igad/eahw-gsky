#!/bin/bash
set -xeu

wget -q https://dl.google.com/go/go1.16.3.linux-amd64.tar.gz -O go.tar.gz
rm -rf go && tar -xf go.tar.gz && rm -f go.tar.gz

export GOPATH=/gsky/gopath

rm -rf $GOPATH && mkdir -p $GOPATH
