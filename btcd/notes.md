## Default account

passphrase: 123

Your wallet generation seed is:
5528e389da93ee1ef7bccd9c586943e9b693f2090a31dbb8353c9d3673b1d40c

```sh
# Unlock local account for 600s.
btcctl -C ./btcctl.conf --wallet walletpassphrase "123" 600    

# Create bew account
btcctl -C ./btcctl.conf --wallet createnewaccount account1

# Get a new address.
btcctl -C ./btcctl.conf --wallet getnewaddress
```

btcd is the blockchain node.
Listens 18334.

btcwallet is the wallet client.
Listens 18332.


## btcwallet doc

Usage:
  btcwallet [OPTIONS]

Application Options:
  -C, --configfile=            Path to configuration file (default:
                               /Users/liamz/Library/Application
                               Support/Btcwallet/btcwallet.conf)
  -V, --version                Display version information and exit
      --create                 Create the wallet if it does not exist
      --createtemp             Create a temporary simulation wallet
                               (pass=password) in the data directory
                               indicated; must call with --datadir
  -A, --appdata=               Application data directory for wallet
                               config, databases and logs (default:
                               /Users/liamz/Library/Application
                               Support/Btcwallet)
      --testnet                Use the test Bitcoin network (version 3)
                               (default mainnet)
      --simnet                 Use the simulation test network (default
                               mainnet)
      --noinitialload          Defer wallet creation/opening on startup
                               and enable loading wallets over RPC
  -d, --debuglevel=            Logging level {trace, debug, info, warn,
                               error, critical} (default: info)
      --logdir=                Directory to log output. (default:
                               /Users/liamz/Library/Application
                               Support/Btcwallet/logs)
      --profile=               Enable HTTP profiling on given port --
                               NOTE port must be between 1024 and 65536
      --walletpass=            The public wallet password -- Only
                               required if the wallet was created with
                               one
  -c, --rpcconnect=            Hostname/IP and port of btcd RPC server
                               to connect to (default localhost:8334,
                               testnet: localhost:18334, simnet:
                               localhost:18556)
      --cafile=                File containing root certificates to
                               authenticate a TLS connections with btcd
      --noclienttls            Disable TLS for the RPC client -- NOTE:
                               This is only allowed if the RPC client is
                               connecting to localhost
      --btcdusername=          Username for btcd authentication
      --btcdpassword=          Password for btcd authentication
      --proxy=                 Connect via SOCKS5 proxy (eg.
                               127.0.0.1:9050)
      --proxyuser=             Username for proxy server
      --proxypass=             Password for proxy server
      --usespv                 Enables the experimental use of SPV
                               rather than RPC for chain synchronization
  -a, --addpeer=               Add a peer to connect with at startup
      --connect=               Connect only to the specified peers at
                               startup
      --maxpeers=              Max number of inbound and outbound peers
                               (default: 125)
      --banduration=           How long to ban misbehaving peers.  Valid
                               time units are {s, m, h}.  Minimum 1
                               second (default: 24h0m0s)
      --banthreshold=          Maximum allowed ban score before
                               disconnecting and banning misbehaving
                               peers. (default: 100)
      --rpccert=               File containing the certificate file
                               (default:
                               /Users/liamz/Library/Application
                               Support/Btcwallet/rpc.cert)
      --rpckey=                File containing the certificate key
                               (default:
                               /Users/liamz/Library/Application
                               Support/Btcwallet/rpc.key)
      --onetimetlskey          Generate a new TLS certpair at startup,
                               but only write the certificate to disk
      --noservertls            Disable TLS for the RPC server -- NOTE:
                               This is only allowed if the RPC server is
                               bound to localhost
      --rpclisten=             Listen for legacy RPC connections on this
                               interface/port (default port: 8332,
                               testnet: 18332, simnet: 18554)
      --rpcmaxclients=         Max number of legacy RPC clients for
                               standard connections (default: 10)
      --rpcmaxwebsockets=      Max number of legacy RPC websocket
                               connections (default: 25)
  -u, --username=              Username for legacy RPC and btcd
                               authentication (if btcdusername is unset)
  -P, --password=              Password for legacy RPC and btcd
                               authentication (if btcdpassword is unset)
      --experimentalrpclisten= Listen for RPC connections on this
                               interface/port
  -b, --datadir=               DEPRECATED -- use appdata instead

Help Options:
  -h, --help                   Show this help message