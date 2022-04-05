#!/bin/bash
set -xeu
DEFAULT_GSKY_REPO='https://github.com/nci/gsky.git'
gsky_repo="${1:-$DEFAULT_GSKY_REPO}"
gsky_branch="${2:-}"

C_INCLUDE_PATH=$(nc-config --includedir)
export C_INCLUDE_PATH

export GOROOT=/go
export PATH="$PATH:$GOROOT/bin"

gsky_src_root=/gsky/gsky_src
mkdir -p $gsky_src_root

git clone "$gsky_repo" $gsky_src_root/gsky

(set -xeu
cd $gsky_src_root/gsky

if [ ! -z "$gsky_branch" ]
then
    git checkout "$gsky_branch"
fi

./configure --prefix=/gsky --bindir=/gsky/bin --sbindir=/gsky/bin --libexecdir=/gsky/bin
make all
make install
)
