#!/bin/bash
set -xeu

export GOROOT=/go
export GO111MODULE=auto
export GOPATH=/gsky/gopath
export PATH="$PATH:$GOROOT/bin"

go get github.com/adnanh/webhook

go build github.com/adnanh/webhook