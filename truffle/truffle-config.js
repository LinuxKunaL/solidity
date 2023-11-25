const mnemonic = process.env["MNEMONIC"];

const HDWalletProvider = require("@truffle/hdwallet-provider");

module.exports = {
  networks: {

    development: {
      host: "127.0.0.1", // Localhost (default: none)
      port: 7545, // Standard Ethereum port (default: none)
      network_id: "*", // Any network (default: none)
    },

    sepolia: {
      provider: () =>
        new HDWalletProvider(
          "metamask",
          "api url"
        ),
      network_id: 11155111,
    },
  },

  // Set default mocha options here, use special reporters etc.
  mocha: {
    // timeout: 100000
  },

  // Configure your compilers
  compilers: {
    solc: {
      version: "0.8.21", // Fetch exact version from solc-bin
    },
  },
};
