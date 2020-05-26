#!/bin/bash
set -ex

# Run without mining.

# btcd \
#     -C ./btcd.conf \
#     --datadir=./data --maxpeers=0 \
#     --connect="1.1.1.1" \
#     --rpcquirks --debuglevel=debug


# Run with mining.

btcd \
    -C ./btcd.conf \
    --datadir=./data --maxpeers=0 \
    --connect="1.1.1.1" \
    --rpcquirks --debuglevel=debug \
    --generate --miningaddr=SRbmutoPPLLaXiUqpo9QChQuWzvkBkQDyP