require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

const { PRIVATE_KEY } = process.env;

if (!PRIVATE_KEY) {
    throw new Error("Please set your PRIVATE_KEY in a .env file");
}

module.exports = {
    defaultNetwork: "swisstronik",
    solidity: "0.8.19",
    networks: {
        swisstronik: {
            url: "https://json-rpc.testnet.swisstronik.com/",
            accounts: [`0x${PRIVATE_KEY}`],
        },
    },
};
