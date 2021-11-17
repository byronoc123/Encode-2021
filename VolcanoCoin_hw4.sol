// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7;

contract VolcanoCoin {
    uint256 public TotalCoins = 10000;
    address owner;
    mapping(address => uint256) public balances;
    error Unauthorized();

    constructor() {
        owner = msg.sender;
        balances[owner] = TotalCoins;
    }

    modifier onlyOwner() {
        if (msg.sender == owner) {
            _;
        }
    }

    struct Payments {
        uint256 transferAmount;
        address recipientAddr;
    }

    mapping(address => Payments) transactions;

    event TransferComplete(uint256, address);

    function transfer(uint256 _amount, address _recipientAddr) public {
        if (msg.sender != owner) {
            revert Unauthorized();
        }
        payable(_recipientAddr).transfer(_amount);
        emit TransferComplete(_amount, _recipientAddr);
    }

    function getVolcanoCoin() public view returns (uint256) {
        return TotalCoins;
    }

    event TotalCoins_update(uint256);

    // Function to increaseTotal supply by 1000, only permissible to owner
    function increaseVolcanoCoin(uint256 new_TotalCoins) public onlyOwner {
        new_TotalCoins = TotalCoins + 1000;
        emit TotalCoins_update(new_TotalCoins);
    }
}
