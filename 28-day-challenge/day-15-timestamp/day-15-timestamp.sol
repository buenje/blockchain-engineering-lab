// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract Antragsworkflow {
    enum Status { submitted, latesubmitted, Approved, Rejected }
    uint256 public deadline;
    constructor() {
        deadline = block.timestamp + 7 days;
    }
    function submitAntrag() public view {
        require(block.timestamp <= deadline, "Frist abgelaufen");
    }
}
