// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/SafeShop.sol";

contract SafeShopTest is Test {
    SafeShop shop;
    address user1 = address(0x1); // Ein Fake-User

    function setUp() public {
        shop = new SafeShop();
    }

    // Test 1: Funktioniert Einzahlen & VIP Logik?
    function testDepositAndVip() public {
        // Wir geben dem Fake-User Geld
        vm.deal(user1, 2 ether);
        
        // Wir tun so, als wären wir user1
        vm.startPrank(user1);
        
        // 1. Einzahlen (1.5 Ether)
        shop.deposit{value: 1.5 ether}();
        
        // 2. Checken: Ist er jetzt VIP?
        // (totalSpent, isVip) = shop.customers(user1)
        (uint256 spent, bool vip) = shop.customers(user1);
        
        assertEq(spent, 1.5 ether);
        assertTrue(vip); // Das heißt: assertEq(vip, true)
        
        vm.stopPrank();
    }

    // Test 2: Funktioniert der Pause-Schalter?
    function testPauseBlockiertDeposit() public {
        // 1. Wir schalten Pause an
        shop.togglePause();
        
        // 2. Wir erwarten, dass der nächste Befehl fehlschlägt ("Revert")
        vm.expectRevert("Shop pausiert");
        
        // 3. Wir versuchen einzuzahlen (das MUSS schiefgehen)
        shop.deposit{value: 1 ether}();
    }
}