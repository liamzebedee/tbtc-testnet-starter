#!/bin/sh
set -ex

# Run without mining.
# btcd \
#     -C ./btcd.conf \
#     --datadir=./data --maxpeers=0 \
#     --connect="1.1.1.1" \
#     --rpcquirks --debuglevel=debug

# Run with mining.
btcd \
    -C /app/btcd.conf \
    --datadir=./btcd_data --maxpeers=0 \
    --connect="1.1.1.1" \
    --txindex \
    --rpcquirks --debuglevel=debug \
    --miningaddr=STSWSw6xqU4mQf8kFKsrnUBsBnB188Mzam &

# WORKAROUND: 
# btcd forces you to use SSL certificates when it is listening on a host that isn't localhost.
# I didn't want to mess around with SSL certificates and configuration between two containers.
# It became rather long to debug.
# This simple workaround makes the localhost socket available externally
# It listens for traffic on 0.0.0.0:18556, and forwards it to
# 127.0.0.1:28556 (the btcd server).
socat tcp-l:18556,fork,reuseaddr tcp:127.0.0.1:28556 &

# Wait for btcd to get up and running.
sleep 3

# Run the btcwallet.
./wallet.sh &

# Wait for btcwallet to get up and running.
# If we don't, it crashes!
sleep 3

# Mine lots of blocks and get that coinbase!
./init_chain.sh

wait