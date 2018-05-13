const HDWalletProvider = require("truffle-hdwallet-provider");

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 9545,
      network_id: "*" // Match any network id
    },
    rinkeby: {
      network_id: 4,
      provider: new HDWalletProvider(
        process.env.METAMASK_MNEMONIC,
        "https://rinkeby.infura.io/LtCp6vYseQHwZxs0i94S"
      )
    }
  }
};
