#!/bin/bash
set -ex
export IMAGE_NAME=btcd_electrumx

docker build -t $IMAGE_NAME ./docker-electrumx

# ElectrumX was crashing with re-org related errors,
# after I instructed simnet to mine 100 blocks. It seems like it was an issue 
# with the asynchronous processing of many incoming blocks. Setting REORG_LIMIT
# to 0 disables the reorg detection logic. 
# Disabling reorg logic is safe for local testing.
export REORG_LIMIT=0

docker run \
    --name btcd_electrumx \
    --rm \
    -e DAEMON_URL=http://admin1:123@host.docker.internal:18556 \
    -e LOG_LEVEL=debug \
    -e SERVICES=tcp://0.0.0.0:50001,ssl://0.0.0.0:50002,ws://0.0.0.0:50003,wss://127.0.0.1:50004,rpc://0.0.0.0:8000 \
    -e COIN=BitcoinSegwit \
    -e NET=simnet \
    -e REORG_LIMIT=$REORG_LIMIT \
    -p 50001:50001 \
    -p 50002:50002 \
    -p 50003:50003 \
    -p 50004:50004 \
    $IMAGE_NAME