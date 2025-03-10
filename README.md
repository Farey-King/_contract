The AjorNFT contract is an on-chain NFT smart contract built using Solidity and OpenZeppelin’s ERC-721 standard. It allows users to contribute ETH and automatically receive a unique, dynamically generated NFT as proof of their participation. The contract ensures all metadata and images are stored fully on-chain, eliminating the need for IPFS or external storage.


## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
