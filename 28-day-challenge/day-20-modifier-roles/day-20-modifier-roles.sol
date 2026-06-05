// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract Rollen {
    address public owner;
    enum Role { Owner, User, Admin }
    mapping(address => Role) public role;
    constructor() {
        owner = msg.sender;
        role[msg.sender] = Role.Owner;
    }
    modifier onlyOwner() {
        require(owner == msg.sender, "not the Owner");
        _;
    }
    modifier onlyUser() {
        require(role[msg.sender] == Role.User, "not the User");
        _;
    }
    modifier onlyAdmin() {
        require(role[msg.sender] == Role.Admin, "not the Admin");
        _;
    }
}
