cat ~/dev/blockchain-engineering-lab/28-day-challenge/_template/README.mdcd ~/dev/blockchain-engineering-lab
remixd -s . --remix-ide https://remix.ethereum.org//SPDX-Identifier-Licensce:MIT;
pragma solidity ^0.8.24;
contract SimpleStorage{
    uint256 public storevalue;
    function set (uint256 _value) public{storevalue=_value;}
    function get () public view returns (uint256)// ← Ankündigung: "ich werde uint256 zurückgeben"
    {return storevalue;}// ← Aktion: "hier ist der Wert"
    function increment() public {storevalue+=1;}
    function decrement() public {storevalue-=1;}
}