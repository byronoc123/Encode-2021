// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract VolcanoCoin {
    //Define contract Owner in constructor
    constructor() {
        owner = msg.sender;
    }

    uint256 TotalCoins = 10000; // Set Coin supply

    address owner;
    // modifier to check the address of the caller is is equal to address of the owner
    modifier onlyOwner() {
        if (msg.sender == owner) {
            _;
        }
    }

    // Function to return value of TotalCoins
    function getVolcanoCoin() public view returns (uint256) {
        return TotalCoins;
    }

    //Event stream to network
    event TotalCoins_update(uint256);

    // Function to increaseTotal supply by 1000, only permissible to owner
    function increaseVolcanoCoin(uint256 new_TotalCoins) public onlyOwner {
        new_TotalCoins = TotalCoins + 1000;
        emit TotalCoins_update(new_TotalCoins);
    }
}
