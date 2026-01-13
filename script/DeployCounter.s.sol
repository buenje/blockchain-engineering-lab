// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Script.sol";
import {Counter} from "../src/Counter.sol";

contract DeployCounter is Script {
    function run() external {
        // Private Key kommt von --private-key oder env var in forge script
        vm.startBroadcast();
        Counter c = new Counter(0);
        vm.stopBroadcast();

        console2.log("Counter deployed at:", address(c));
    }
}
