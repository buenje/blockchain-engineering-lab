// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract Antragstatus {
    address public Antragssteller;
    bool public finished;
    function statusAntrag() public view {
        require(!finished, "Antrag already completed");
    }
}
