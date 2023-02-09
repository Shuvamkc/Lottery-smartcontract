/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: {
    version: '0.8.9',
    networks :{
       goerli :
       {
           url : 'https://rpc.ankr.com/eth_goerli',
           accounts : [`0x${process.env.Private_Key}`],
           chainId : 5,
       }
    },
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
};
