require("@nomiclabs/hardhat-waffle");

module.exports = {
  solidity: "0.8.0",
  networks: {
    rinkeby: {
      url: "https://eth-rinkeby.alchemyapi.io/v2/COBPmR1rNxL1i-jHzvLAalHjYPue-NCy",
      accounts: ["9947f7669069318bd168057b066506ddca6f7a89e26b4b82b85bc93cf306b903"]
    },
  },
};// 0x88E6F065FBdbb8cCdE70DB5f10748b8CCe4Ec197