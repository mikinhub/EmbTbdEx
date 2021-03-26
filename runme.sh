#!/bin/bash

# Build image
TAG=embtbdex
docker build --tag $TAG docker/.

# Run image
case $1 in
    clean)
	CMD="make -C /data clean"
	;;

    sh|bash)
	CMD="sh"
	;;

    *)
	CMD="make -C /data"
	;;
esac
docker run --rm -it -v $PWD:/data $TAG $CMD

