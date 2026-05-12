// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract AntragRegister {
    mapping(uint256 => address) public antraege;
    function setAddress(uint256 id, address antragsteller) public { antraege[id] = antragsteller; }
    function getAddress(uint256 id) public view returns (address) { return antraege[id]; }
}
