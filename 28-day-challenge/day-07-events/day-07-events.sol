// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract SetStatusPermission {
    event applicationSubmitted(uint256 indexed id, address indexed applicant);
    function submitApplication(uint256 _id) public {
        emit applicationSubmitted(_id, msg.sender);
    }
}
