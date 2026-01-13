// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import {DonatePause} from "../src/DonatePause.sol";

contract DonatePauseTest is Test {
    DonatePause internal d;
    address internal owner = address(this);
    address internal alice = address(0xA11CE);

    function setUp() public {
        d = new DonatePause();
    }

    function testDonateWorksWhenNotPaused() public {
        vm.deal(alice, 1 ether);
        vm.prank(alice);
        d.donate{value: 0.25 ether}();
        // Kein revert == ok. Optional: Balance im Contract prüfen.
        assertEq(address(d).balance, 0.25 ether);
    }

    function testPauseAndUnpause() public {
        // Pause durch Owner
        d.pause();
        assertTrue(d.paused());

        // donate() sollte jetzt revertieren
        vm.deal(alice, 1 ether);
        vm.prank(alice);
        vm.expectRevert(bytes("paused"));
        d.donate{value: 0.1 ether}();

        // Unpause
        d.unpause();
        assertFalse(d.paused());

        // donate() geht wieder
        vm.prank(alice);
        d.donate{value: 0.1 ether}();
        assertEq(address(d).balance, 0.1 ether);
    }

    function testSweepOnlyOwner() public {
        // Fülle den Contract
        vm.deal(alice, 100 ether);
        vm.prank(alice);
        d.donate{value: 100 ether}();

        // Fremder darf nicht sweepen
        vm.prank(address(0xBEEF));
        vm.expectRevert(bytes("not owner"));
        d.sweep();


        // Owner sweeped
        uint256 beforeBal = owner.balance;
        d.sweep();
        assertEq(address(d).balance, 0);
        assertEq(owner.balance, beforeBal + 0.3 ether);
    }
    receive() external payable {}
    
}

