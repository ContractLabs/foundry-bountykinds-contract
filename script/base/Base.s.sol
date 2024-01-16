// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { console2, Script } from "forge-std/Script.sol";
import { IScript } from "./Interfaces.sol";
import { ErrorHandler } from "../../src/oz-custom/libraries/ErrorHandler.sol";

abstract contract BaseScript is Script, IScript {
    using ErrorHandler for *;

    modifier broadcast() {
        vm.startBroadcast();
        _;
        vm.stopBroadcast();
    }

    function run(bytes calldata callData) external {
        (bool success, bytes memory returnOrRevertData) =
            address(this).delegatecall(callData);
        success.handleRevertIfNotSuccess(returnOrRevertData);
    }
}
