# Unlock local account for 6000000000s.
btcctl -C ./btcctl.conf --wallet walletpassphrase "123" 6000000000

# Create new account
btcctl -C ./btcctl.conf --wallet createnewaccount account1

# Get a new address.
btcctl -C ./btcctl.conf --wallet getnewaddress

# Generate a minimum 320 blocks. This is for two reasons:
# 1) Miner coinbase unlocks after 100 blocks (so called 'cooldown')
# 2) The threshold for segwit activation is 300 blocks on simnet
btcctl -C ./btcctl.conf --wallet setgenerate 0
btcctl -C ./btcctl.conf --wallet generate 320