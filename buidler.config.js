usePlugin("@nomiclabs/buidler-waffle");

// The next line is part of the sample project, you don't need it in your
// project. It imports a Buidler task definition, that can be used for
// testing the frontend.
require("./tasks/faucet");
usePlugin("@nomiclabs/buidler-waffle");

// Go to https://infura.io/ and create a new project
// Replace this with your Infura project ID
const INFURA_PROJECT_ID = "f269d0a81ec947258ccb03a0857ccff5";

// Replace this private key with your Ropsten account private key
// To export your private key from Metamask, open Metamask and
// go to Account Details > Export Private Key
// Be aware of NEVER putting real Ether into testing accounts
const ROPSTEN_PRIVATE_KEY = "A83EB7747BE00E0F36C2E6566AE61BD9CFEBBB411C27C9E9D865B6E4214E376B";

module.exports = {
defaultNetwork: "ropsten",
  networks: {
    kovan: {
      url: `https://kovan.infura.io/v3/${INFURA_PROJECT_ID}`,
      accounts: [`0x${ROPSTEN_PRIVATE_KEY}`]
    }
  }
};

