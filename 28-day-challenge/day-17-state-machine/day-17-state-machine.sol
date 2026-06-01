// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract statemachine {
    enum Status { Submitted, Underreview, Approved, Rejected }
    Status public currentStatus;
    function submit() public {
        require(currentStatus == Status.Submitted, "Antrag bereits eingereicht");
        currentStatus = Status.Submitted;
    }
    function startReview() public {
        require(currentStatus == Status.Submitted, "Antrag nicht eingereicht");
        currentStatus = Status.Underreview;
    }
    function approve() public {
        require(currentStatus == Status.Underreview, "Antrag ist geprueft");
        currentStatus = Status.Approved;
    }
    function reject() public {
        require(currentStatus == Status.Underreview, "Antrag zurueckgewiesen");
        currentStatus = Status.Rejected;
    }
}
