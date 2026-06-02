// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract OwnStatus {
    address public owner;
    enum Status { None, Submitted, Underreview, Approved, Rejected }
    mapping(address => Status) public status;
    function submit() public {
        require(status[msg.sender] == Status.None, "Antrag bereits eingereicht");
        status[msg.sender] = Status.Underreview;
    }
    function approve() public {
        require(status[msg.sender] == Status.Underreview, "Antrag ist geprueft");
        status[msg.sender] = Status.Approved;
    }
    function rejected() public {
        require(status[msg.sender] == Status.Underreview, "Antrag zurueckgewiesen");
        status[msg.sender] = Status.Rejected;
    }
}
