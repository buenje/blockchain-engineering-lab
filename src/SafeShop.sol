// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SafeShop {
    // Level 2 Variablen
    address public immutable i_owner;
    bool public isPaused; // Startet false
    
    // Unsere Structs & Mappings
    struct Customer {
        uint256 totalSpent;
        bool isVip;
    }
    mapping(address => Customer) public customers;

    constructor() {
        i_owner = msg.sender;
    }

    function deposit() external payable {
        // Der Sicherheits-Check
        require(!isPaused, "Shop pausiert");

        // Struct Update
        customers[msg.sender].totalSpent += msg.value;
        
        // Kleine Logik: Wer mehr als 1 Ether zahlt, wird VIP
        if (customers[msg.sender].totalSpent >= 1 ether) {
            customers[msg.sender].isVip = true;
        }
    }

    function togglePause() external {
        require(msg.sender == i_owner, "Nicht Chef");
        isPaused = !isPaused;
    }
}