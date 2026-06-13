// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract MultipleAntragsteller {
    address public owner;
    enum Role { Owner, User, Admin }
    mapping(address => Role) public role;
    constructor(address _owner) {
        owner = _owner;
        role[msg.sender] = Role.Owner;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "not the owner");
        _;
    }
}
