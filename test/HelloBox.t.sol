// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import {HelloBox} from "../src/HelloBox.sol";

contract HelloBoxTest is Test {
    HelloBox sut; // system under test
    address alice = address(0xA11CE);

    function setUp() public {
        sut = new HelloBox(); // deploy im Test
    }

    function testInitialMessageEmpty() public {
        assertEq(sut.message(), ""); // Auto-Getter von 'message'
    }

    function testOwnerCanSetMessage() public {
        sut.setMessage("hi");
        assertEq(sut.message(), "hi");
    }

    function testNonOwnerReverts() public {
        vm.prank(alice); // als Fremder callen
        vm.expectRevert(HelloBox.NotOwner.selector); // Custom Error prüfen
        sut.setMessage("nope");
    }

    // Optional: Event prüfen
    function testEmitsEventOnSet() public {
        vm.expectEmit(); // nächstes Event vergleichen
        emit HelloBox.MessageSet("hello", address(this)); // Erwartung
        sut.setMessage("hello");
    }
}
