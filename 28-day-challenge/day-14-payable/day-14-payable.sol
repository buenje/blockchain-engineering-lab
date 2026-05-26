// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract Antragsgebuehr {
    address public owner;
    uint public fee;
    bool public payed;
    function pay() public payable {
        require(msg.value >= 1 ether, "Zu wenig bezahlt");
        payed = true;
    }
}
