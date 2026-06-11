// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract GovermentStatus {
    enum Status { None, Submitted, Underreview, Returned, Completed }
    mapping(uint256 => Status) public statuses;
    address public owner;
    event StatusChange(uint256 id, Status newStatus);
    Status public currentStatus;
    function submit(uint256 id) public {
        require(currentStatus == Status.None, "Antrag bereits eingereicht");
        statuses[id] = Status.Submitted;
        currentStatus = Status.Submitted;
        emit StatusChange(id, Status.Submitted);
    }
    function startReview(uint256 id) public {
        require(currentStatus == Status.Submitted, "Antrag nicht eingereicht");
        statuses[id] = Status.Underreview;
        currentStatus = Status.Underreview;
        emit StatusChange(id, Status.Underreview);
    }
    function approve(uint256 id) public {
        require(currentStatus == Status.Underreview, "Antrag ist geprueft");
        statuses[id] = Status.Completed;
        currentStatus = Status.Completed;
        emit StatusChange(id, Status.Completed);
    }
    function reject(uint256 id) public {
        require(currentStatus == Status.Underreview, "Antrag zurueckgewiesen");
        statuses[id] = Status.Returned;
        currentStatus = Status.Returned;
        emit StatusChange(id, Status.Returned);
    }
}
