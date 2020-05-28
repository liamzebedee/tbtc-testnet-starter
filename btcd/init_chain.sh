# Unlock local account for 6000000000s.
btcctl -C ./btcctl.conf --wallet walletpassphrase "123" 6000000000

# Create new account
btcctl -C ./btcctl.conf --wallet createnewaccount account1

# Get a new address.
btcctl -C ./btcctl.conf --wallet getnewaddress

# Generate the minimum 250 blocks
btcctl -C ./btcctl.conf --wallet setgenerate 0
btcctl -C ./btcctl.conf --wallet generate 250