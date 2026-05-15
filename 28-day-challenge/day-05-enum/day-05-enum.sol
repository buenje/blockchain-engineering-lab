// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract GovermentStatus {
    enum Status { Submitted, InReview, Returned, Completed }
    mapping(uint256 => Status) public statuses;
    function setStatus(uint256 _id, Status _status) public { statuses[_id] = _status; }
    function getStatus(uint256 _id) public view returns (Status) { return statuses[_id]; }
}
