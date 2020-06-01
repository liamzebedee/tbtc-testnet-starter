
Developing with the BTC testnet can be quite slow:

 * difficulty can be very unpredictable.
 * sending/receiving transactions can take 10mins at least.
 * to make transactions, you need money from faucets.

This repo sets up:

 * a Bitcoin testnet using btcd and btcwallet.
 * a local ElectrumX server, forked to work with btcd.
 * pre-funded Bitcoin account for funding tBTC deposits.

Known issues:

- [ ] tbtc.js will fail redemption with "Tx spends the wrong UTXO", for [certain address types](https://github.com/liamzebedee/tbtc-testnet-starter/issues/1).

## Install.

```sh
git clone https://github.com/liamzebedee/tbtc-testnet-starter
cd tbtc-testnet-starter/
git submodule update --init --recursive
```

## Usage.

btcd and ElectrumX are both built using Docker images. No additional software is needed.

```sh
# Start btcd, btcwallet.
$ ./scripts/run-btcd.sh

# Start ElectrumX.
$ ./scripts/run-electrumx.sh
```

The ElectrumX server will be running on ports 50001-50004. 

## Interacting with your bitcoin simnet.

```sh

$ docker exec -it btcd sh

# Send bitcoin from the "default" miner account.
/app $ btcctl -C ./btcctl.conf --wallet sendfrom default sb1qe2s2ag7n63jcrktewzfvfuawmgqscd5rdvet6y 0.001

# Mine a block.
/app $ btcctl -C ./btcctl.conf --wallet generate 1
[
  "7e4764ea96630a88c8cf2868393e72222b9f8f1a152f11c798ab717142ffbb98"
]
```

## A brief explainer.

`btcd` is an alternative to the bitcoind software. It features a separate server, `btcwallet`, that hosts a wallet RPC interface. It comes with a tool called `btcctl` to send RPC calls to the `btcd` and `btcwallet` daemons. 

We run a testnet instance of the bitcoin network called simnet. Simnet has its own address prefix, different from Bitcoin Testnet and Bitcoin Mainnet. simnet is a btcd-only feature (it's not part of bitcoind/bitcoin core).

ElectrumX doesn't support btcd out-of-the-box, and doesn't have a configuration for the simnet genesis. Hence, we use a forked version which is patched to support this.

