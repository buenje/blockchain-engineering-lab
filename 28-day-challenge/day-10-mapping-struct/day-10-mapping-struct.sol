// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract AntragPlan {
    struct Antrag {
        uint256 id;
        address Name;
    }
    mapping(uint256 => Antrag) public antragMap;
}
