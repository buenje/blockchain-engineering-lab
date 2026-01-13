// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title Counter – winziges Beispiel
contract Counter {
    uint256 private _count;
    address public immutable owner;

    event Incremented(uint256 newValue, address indexed by);
    event Reset(uint256 oldValue, address indexed by);

    constructor(uint256 initial) {
        owner = msg.sender;
        _count = initial;
    }

    function count() external view returns (uint256) {
        return _count;
    }

    function increment() external {
        _count += 1;
        emit Incremented(_count, msg.sender);
    }

    function reset() external {
        require(msg.sender == owner, "not owner");
        uint256 old = _count;
        _count = 0;
        emit Reset(old, msg.sender);
    }
}
