// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
interface IAntrag {
    function setStatus(uint256 _id, uint256 _status) external;
    function getStatus(uint256 _id) external view returns (uint256);
}
contract Antrag is IAntrag {
    mapping(uint256 => uint256) private statuses;
    function setStatus(uint256 _id, uint256 _status) external override {
        statuses[_id] = _status;
    }
    function getStatus(uint256 _id) external view override returns (uint256) {
        return statuses[_id];
    }
}
