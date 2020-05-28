#!/bin/bash
set -ex
export IMAGE_NAME=btcd

docker build -t $IMAGE_NAME --force-rm ./btcd

docker run \
    -it \
    --name btcd \
    --rm \
    -v $(pwd)/btcd/btcd_data:/app/btcd_data \
    -v $(pwd)/btcd/btcwallet_data:/app/btcwallet_data \
    -p 18554:18554 \
    -p 18555:18555 \
    -p 18556:18556 \
    $IMAGE_NAME \
    /app/run.sh