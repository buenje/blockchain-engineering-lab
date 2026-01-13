// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract HelloBox {
    address public immutable owner; // erzeugt: owner() external view returns (address)
    string public message; // erzeugt: message() external view returns (string memory)

    event MessageSet(string newMessage, address indexed by);
    error NotOwner();

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        if (msg.sender != owner) revert NotOwner();
        _;
    }

    // günstig, weil calldata
    function setMessage(string calldata newMessage) external onlyOwner {
        message = newMessage;
        emit MessageSet(newMessage, msg.sender);
    }

    // optional: interne Wiederverwendung
    function _setMessage(string memory m) internal {
        message = m;
    }
}
