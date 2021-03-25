#!/bin/bash

TAG=embtbdex

docker build --tag $TAG docker/.

docker run --rm -it -v $PWD:/data $TAG make -C /data clean
