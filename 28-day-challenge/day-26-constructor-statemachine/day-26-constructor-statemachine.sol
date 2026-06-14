// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract claimworkflow {
    address public owner;
    enum Role { Owner, User, Admin }
    enum Status { none, submitted, underreview, approved, rejected }
    mapping(address => Role) public roles;
    mapping(address => Status) public statuses;
    constructor() {
        owner = msg.sender;
        roles[msg.sender] = Role.Owner;
    }
    modifier onlyOwner() {
        require(roles[msg.sender] == Role.Owner, "Only owner can perform this action");
        _;
    }
    modifier onlyUser() {
        require(roles[msg.sender] == Role.User, "Only user can perform this action");
        _;
    }
    modifier onlyAdmin() {
        require(roles[msg.sender] == Role.Admin, "Only admin can perform this action");
        _;
    }
    function assignRole(address user, Role role) public onlyOwner { roles[user] = role; }
    function getRole(address user) public view returns (Role) { return roles[user]; }
}
