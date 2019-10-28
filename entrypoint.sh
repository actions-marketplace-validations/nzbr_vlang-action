#!/bin/bash

set -ex

whoami
id -u

if [ "$INPUT_COMPILER" != "master" ]; then
	pushd /opt/v
	git clean -xf
	git fetch
	git reset --hard origin/master
	git checkout "$INPUT_COMPILER"

	make
	v -o v v.v
	sudo v symlink
	popd
fi

v $INPUT_ARGS $INPUT_FILE
