// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SafeVault {
    // 1. STATE: Wo ist das Geld?
    mapping(address => uint256) public balances;

    // 2. DEPOSIT: Geld einzahlen
    // 'payable' ist wichtig, damit der Contract Ether annehmen kann
    function deposit() external payable {
        // Wir addieren den gesendeten Betrag (msg.value) zum Guthaben des Senders
        balances[msg.sender] += msg.value;
    }

    // 3. WITHDRAW: Alles abheben (DEIN MEISTERSTÜCK)
    // Beachte die Reihenfolge! (Checks-Effects-Interactions)
    function withdrawAll() external {
        // SCHRITT A: Wie viel hat der User? (Check/Read)
        uint256 amount = balances[msg.sender];

        // Sicherheits-Check: Hat er überhaupt Geld?
        require(amount > 0, "Kein Guthaben vorhanden");

        // SCHRITT B: Guthaben auf 0 setzen (Effect)
        // WICHTIG: Das muss VOR dem Senden passieren!
        balances[msg.sender] = 0;

        // SCHRITT C: Geld senden (Interaction)
        // Wir nutzen 'call', wie du richtig gesagt hast
        (bool success, ) = msg.sender.call{value: amount}("");
        
        // Checken, ob das Senden geklappt hat
        require(success, "Transfer fehlgeschlagen");
    }
}