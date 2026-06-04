// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract ShowStatus {
    address public owner;
    enum Status { none, submitted, underreview, approved, rejected }
    event StatusChanged(address indexed user, Status newStatus);
    mapping(address => Status) public Statuses;
    function submit() public {
        require(Statuses[msg.sender] == Status.none, "Bereits eingereicht");
        Statuses[msg.sender] = Status.submitted;
        emit StatusChanged(msg.sender, Status.submitted);
    }
    function approve() public {
        require(Statuses[msg.sender] == Status.underreview, "nicht in pruefung");
        Statuses[msg.sender] = Status.approved;
        emit StatusChanged(msg.sender, Status.approved);
    }
    function reject() public {
        require(Statuses[msg.sender] == Status.approved, "ist genehmigt");
        Statuses[msg.sender] = Status.rejected;
        emit StatusChanged(msg.sender, Status.rejected);
    }
}
