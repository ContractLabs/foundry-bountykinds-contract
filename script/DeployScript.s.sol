// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "boundry-deployment-kit/BaseDeploy.s.sol";
import {
    IAuthority,
    AggregatorV3Interface,
    BKTreasury
} from "../src/mainnet/BKTreasury.sol";

contract DeployScript is BaseDeploy {
    function deployTreasury() public broadcast {
        address proxy = deployProxyRaw(
            "mainnet/BKTreasury.sol:BKTreasury",
            abi.encodeCall(
                BKTreasury.initialize,
                (
                    "BKGlobalTreasury",
                    IAuthority(0x3005775740fA97131036b6aBfe86fc2acd70f7F0),
                    AggregatorV3Interface(
                        0x2514895c72f50D8bd4B4F9b1110F0D6bD2c97526
                        )
                )
            )
        );
        console2.log("TREASURY_PROXY", vm.toString(proxy));
    }

    // function changeVault() public broadcast {
    //     IAuthority(0x3005775740fA97131036b6aBfe86fc2acd70f7F0).changeVault()
    // }
}
