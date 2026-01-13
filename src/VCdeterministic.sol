// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MilestoneRelease {
    enum State { Defined, EvidenceSubmitted, Verified, Released }
    State public state;

    address public founder;
    address public verifier;
    address public gp;

    event StateChanged(State from, State to);

    error WrongState();
    error NotAuthorized();

    modifier only(address a) {
        if (msg.sender != a) revert NotAuthorized();
        _;
    }

    modifier inState(State s) {
        if (state != s) revert WrongState();
        _;
    }

    constructor(address _founder, address _verifier, address _gp) {
        founder = _founder;
        verifier = _verifier;
        gp = _gp;
        state = State.Defined;
    }

    function submitEvidence() external only(founder) inState(State.Defined) {
        _set(State.EvidenceSubmitted);
    }

    function verify() external only(verifier) inState(State.EvidenceSubmitted) {
        _set(State.Verified);
    }

    function release() external only(gp) inState(State.Verified) {
        _set(State.Released);
    }

    function _set(State next) internal {
        emit StateChanged(state, next);
        state = next;
    }
}
