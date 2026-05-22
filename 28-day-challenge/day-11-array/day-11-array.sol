// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract AntragList {
    address[] public antragsteller;
    function addAntragsteller() public {
        antragsteller.push(msg.sender);
    }
}
