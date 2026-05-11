// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract SimpleStorage{
    uint256 public storevalue;
    function set (uint256 _value) public{storevalue=_value;}
    function get () public view returns (uint256){return storevalue;}
    function increment() public {storevalue+=1;}
    function decrement() public {storevalue-=1;}
    }