// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract Antrag {
    address public owner;
    uint256 public antragCount;
    constructor() {
        owner = msg.sender;
    }
    modifier onlyOwner() {
        require(owner == msg.sender, "not the Owner");
        _;
    }
    function countAntrag() public onlyOwner { antragCount += 1; }
}
