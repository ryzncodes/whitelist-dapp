const { ethers } = require("hardhat");

async function main() {

/*
ContractFactory in ethers.js to deploy smart contract. 
whitelistContract is a factory for instances of Whitelist contract.
*/

    const whitelistContract = await ethers.getContractFactory("Whitelist");

    //to deploy the contract
    const deployedWhitelistContract = await whitelistContract.deploy(10);
    //10 is the input we are putting in contructor (max address to whitelist)

    //wait for the contract to finish deploying
    await deployedWhitelistContract.deployed();

    //print address of deployed contract
    console.log(
        "Deployed whitelist contract address:",
        deployedWhitelistContract.address
    );
}

//call the main function & catch if theres any error (boilerplate stuff)
main ()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });