//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ToggelLock {
    address public immutable owner;
    bool public locked;

    event Locked(address indexed by);
    event Unlocked(address indexed by);
    error NotOwner();

    constructor() {
        owner = msg.sender;
        locked = false;
    }

    modifier onlyOwner() {
        if (msg.sender != owner) revert NotOwner();
        _;
    }

    function lock() external onlyOwner {
        locked = true;
        emit Locked(msg.sender);
    }

    function unlock() external onlyOwner {
        locked = false;
        emit Unlocked(msg.sender);
    }
}