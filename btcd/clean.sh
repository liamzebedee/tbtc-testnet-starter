set -ex

# If btcd/btcwallet crash, it will start up with a cryptic error
#     btcwallet_1  | panic: Unable to synchronize wallet to chain: -1: Block number out of range
# This will fix that. `wallet.db` is being corrupted somewhere...
cp wallet.bak btcwallet_data/simnet/wallet.db
rm -r btcd_data
rm -r ../electrumx/electrumx_data