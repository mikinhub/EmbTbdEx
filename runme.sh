#!/bin/bash

# Build image
TAG=embtbdex
docker build --tag $TAG docker/.

# Run image
case $1 in
    clean)
	docker run --rm -it -v $PWD:/data $TAG make -sC /data clean
	;;

    sh)
	docker run --rm -it -v $PWD:/data $TAG sh
	;;

    *)
	docker run --rm -it -v $PWD:/data $TAG make -sC /data Tiny
	docker run --rm -it -v $PWD:/data $TAG make -sC /data Mini
	docker run --rm -it -v $PWD:/data $TAG make -sC /data Medi
	docker run --rm -it -v $PWD:/data $TAG make -sC /data Huge
	;;
esac


