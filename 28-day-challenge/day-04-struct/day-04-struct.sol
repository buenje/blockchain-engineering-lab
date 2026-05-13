// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract Antragsverwaltung {
    struct Antrag {
        uint256 id;
        address antragsteller;
    }
    Antrag public antrag;
    function setAntrag(uint256 id, address antragsteller) public { antrag.id = id; antrag.antragsteller = antragsteller; }
    function getAntrag() public view returns (uint256, address) { return (antrag.id, antrag.antragsteller); }
}
