# Smart Contract Development Setup Guide

## Prerequisites

Before you begin, make sure you have the following tools installed on your local machine:

1. **Ganache (Tool):** Download and install Ganache to set up a local blockchain environment. You can download Ganache [here](https://ganache.io/).

2. **Truffle (Tool):** Download and install Truffle to compile and deploy smart contracts. You can download Truffle [here](https://www.trufflesuite.com/truffle).

## Truffle Commands

Once you have Ganache and Truffle installed, use the following Truffle commands to manage your smart contract development:

- **Initialize a Truffle project with the MetaCoin template:**

  ```bash
  truffle unbox metacoin
  ```

- **Initialize a new Truffle project:**

  ```bash
  truffle init
  ```

- **Compile smart contracts:**

  ```bash
  truffle compile
  ```

- **Deploy smart contracts to the local Ganache blockchain:**
  ```bash
  truffle migrate
  ```

  - **Deploy smart contracts to the testnet / mainnet blockchain:**
  ```bash
  truffle migrate --network sepolia
  ```


## Configurations

### Local Machine (Ganache)

Update your Truffle configuration for the local machine in `truffle-config.js`:

````javascript
development: {
    host: "127.0.0.1",
    port: 7545,
    network_id: "*",
}
````

## Testnet (Alchemy) Configuration

To configure for a testnet using Alchemy, follow these steps:

1. **Login to Alchemy:** Visit [Alchemy](https://alchemyapi.io/) and create an account.

2. **Create a Project and Get API Key:** After logging in, create a new project to obtain your API key.

3. **Update Truffle Config with Alchemy Settings:**

```javascript
goerli: {
    provider: () => new HDWalletProvider("metamask security phase", "api url with key"),
    network_id: 5,
}
```

Make sure to replace "meta mask security phase" with your MetaMask security phrase and "api url with key" with your Alchemy API URL, including the key.

