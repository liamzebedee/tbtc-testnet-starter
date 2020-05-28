
Developing with the BTC testnet can be quite slow:

 * difficulty can be very unpredictable.
 * sending/receiving transactions can take 10mins at least.
 * to make transactions, you need money from faucets.

This repo sets up:

 * a Bitcoin testnet using btcd and btcwallet.
 * a local ElectrumX server, forked to work with btcd.
 * pre-funded Bitcoin account for funding tBTC deposits.

Remaining to fix:

 - [ ] Publish changes for tbtc.js, to use the simnet config from `bcoin`.
 - [ ] tbtc.js fails at redemption when transaction is sent via simnet chain, with revert error "Tx spends the wrong UTXO"

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

## Configuring tBTC

You must configure tbtc.js with the correct bitcoinNetwork and ElectrumX server.

```js
const tbtc = await TBTC.withConfig({
    web3: web3,
    bitcoinNetwork: "simnet",    // (1)
    electrum: {
        testnetWS: {             // (2)
            server: "127.0.0.1",
            port: 50003,
            protocol: "ws"
        },
    }
})
```

You must also configure the [tbtc-maintainer](https://github.com/keep-network/tbtc-maintainers) to connect to your local ElectrumX server. Edit your `config.toml`:

```sol
# Connection details of a Electrum Server.
[electrum]
    ServerHost  = "127.0.0.1"
    ServerPort  = "50002"
    Protocol    = "SSL" # TCP or SSL
```

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