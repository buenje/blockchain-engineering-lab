// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract Base {
    address public antragssteller;
    string public name;
    constructor() {
        antragssteller = msg.sender;
    }
    modifier onlyAntragssteller() {
        require(msg.sender == antragssteller, "Only Antragssteller");
        _;
    }
    function setName(string memory _name) public onlyAntragssteller {
        name = _name;
    }
}
contract Child is Base {
}
