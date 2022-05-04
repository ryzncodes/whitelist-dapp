// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

contract Whitelist {

    // Max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    //Mapping of whitelistedAddresses
    //if an address is whitelisted, bool will be set to true. false by default to other addresses
    mapping(address => bool) public whitelistedAddresses;

    uint8 public numAddressesWhitelisted;

    //Setting max number of whitelisted addresses
    //User will put the value at time of deployment for max number

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    //Adds address of sender to the whitelist
    function addAddressToWhitelist() public {
        //check if user has been whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whiterlisted");
        //check if numAddressesWhitelisted < maxWhitelistedAddresses, throw error if false
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses can't be added");
        //add address which called the function to whitelistedAddresses mapping array
        whitelistedAddresses[msg.sender] = true;
        //increase numAddressesWhitelisted
        numAddressesWhitelisted += 1; 
    }
    
}