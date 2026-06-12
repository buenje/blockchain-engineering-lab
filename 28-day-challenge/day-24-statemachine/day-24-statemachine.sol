// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract Govmachine {
    address public owner;
    enum GovMachine { none, submitted, underreview, approval, rejected }
    mapping(uint256 => GovMachine) public GovMachines;
    event StatusChanged(uint256 indexed id, address indexed sender, GovMachine newStatus);
    function submit(uint256 id) public {
        require(GovMachines[id] == GovMachine.none, "Bereits eingereicht");
        GovMachines[id] = GovMachine.submitted;
        emit StatusChanged(id, msg.sender, GovMachine.submitted);
    }
    function startReview(uint256 id) public {
        require(GovMachines[id] == GovMachine.submitted, "Nicht eingereicht");
        GovMachines[id] = GovMachine.underreview;
        emit StatusChanged(id, msg.sender, GovMachine.underreview);
    }
    function approve(uint256 id) public {
        require(GovMachines[id] == GovMachine.underreview, "Noch in Pruefung");
        GovMachines[id] = GovMachine.approval;
        emit StatusChanged(id, msg.sender, GovMachine.approval);
    }
    function reject(uint256 id) public {
        require(GovMachines[id] == GovMachine.underreview, "Wird zurueckgewiesen");
        GovMachines[id] = GovMachine.rejected;
        emit StatusChanged(id, msg.sender, GovMachine.rejected);
    }
}
