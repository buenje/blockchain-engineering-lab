// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title DonatePause – Mini-Contract mit Pause/Unpause und Spendenannahme
contract DonatePause {
    address public immutable owner;
    bool private _paused;

    event Paused(address indexed by);
    event Unpaused(address indexed by);
    event Donate(address indexed from, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    modifier notPaused() {
        require(!_paused, "paused");
        _;
    }

    constructor() {
        owner = msg.sender;
        _paused = false;
    }

    function paused() external view returns (bool) {
        return _paused;
    }

    /// @notice Pausiert interaktive Funktionen
    function pause() external onlyOwner {
        require(!_paused, "already paused");
        _paused = true;
        emit Paused(msg.sender);
    }

    /// @notice Hebt Pause wieder auf
    function unpause() external onlyOwner {
        require(_paused, "not paused");
        _paused = false;
        emit Unpaused(msg.sender);
    }

    /// @notice Annahme einer Spende (nur wenn nicht pausiert)
    function donate() external payable notPaused {
        require(msg.value > 0, "no value");
        emit Donate(msg.sender, msg.value);
    }

    /// @notice Auszahlen des kompletten Saldos an den Owner
    function sweep() external onlyOwner {
        (bool ok,) = owner.call{value: address(this).balance}("");
        require(ok, "transfer failed");
    }
    receive() external payable {}
        // erlaubt natives ETH, zählt aber nicht als donate()
    
}
