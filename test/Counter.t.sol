// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter internal c;

    function setUp() public {
        c = new Counter(41);
    }

    function testInitialValue() public {
        assertEq(c.count(), 41);
    }

    function testIncrement() public {
        c.increment();
        assertEq(c.count(), 42);
    }

    function testResetOnlyOwner() public {
        // Nicht-Owner
        vm.prank(address(0xBEEF));
        vm.expectRevert(bytes("not owner"));
        c.reset();

        // Owner
        c.reset();
        assertEq(c.count(), 0);
    }
}
