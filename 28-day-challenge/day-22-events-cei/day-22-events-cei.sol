// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract depositAmount {
    event Deposit(address indexed user, uint256 amount);
    event Withdrawal(address indexed user, uint256 amount);
    mapping(address => uint) public balance;
    function deposit() public payable {
        balance[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }
    function withdrawAmount() public {
        uint256 amount = balance[msg.sender];
        require(amount > 0, "Not enough balance");
        balance[msg.sender] = 0;
        emit Withdrawal(msg.sender, amount);
        payable(msg.sender).transfer(amount);
    }
}
