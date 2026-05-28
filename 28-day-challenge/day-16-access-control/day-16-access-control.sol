// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract Rollen {
    address public owner;
    enum Role {Owner, User, Admin}
    mapping(address => Role) public role;
    constructor() {
        owner = msg.sender;
        role[msg.sender] = Role.Owner;
    }
}
