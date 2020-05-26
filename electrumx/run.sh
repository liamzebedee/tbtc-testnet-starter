#!/bin/bash
set -ex

docker run \
  --rm \
  --name electrumx \
  -v `pwd`/electrumx_data:/data \
  -e DAEMON_URL=admin1:123@host.docker.internal:18556 \
  -e LOG_LEVEL=debug \
  -e SERVICES=tcp://0.0.0.0:50001,ssl://0.0.0.0:50002,ws://0.0.0.0:50003,wss://0.0.0.0:50004,rpc://0.0.0.0:8000 \
  -p 127.0.0.1:50001:50001/tcp \
  -p 127.0.0.1:50002:50002/tcp \
  -p 127.0.0.1:50003:50003/tcp \
  -p 127.0.0.1:50004:50004/tcp \
  -e COIN=BitcoinSegwit \
  -e NET=simnet \
  electrumx_simnet