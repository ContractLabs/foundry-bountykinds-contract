// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "boundry-deployment-kit/BaseDeploy.s.sol";
import {
    IAuthority,
    AggregatorV3Interface,
    BKTreasury
} from "../src/mainnet/BKTreasury.sol";

contract DeployScript is BaseDeploy {
    // function deployTreasury() public broadcast {
    //     address proxy = deployProxyRaw(
    //         "mainnet/BKTreasury.sol:BKTreasury",
    //         abi.encodeCall(
    //             BKTreasury.initialize,
    //             (
    //                 "BKGlobalTreasury",
    //                 IAuthority(0x3005775740fA97131036b6aBfe86fc2acd70f7F0),
    //                 AggregatorV3Interface(
    //                     0x2514895c72f50D8bd4B4F9b1110F0D6bD2c97526
    //                     )
    //             )
    //         )
    //     );
    //     console2.log("TREASURY_PROXY", vm.toString(proxy));
    // }

    function upgradeTreasury() public broadcast {
        address proxy = 0xf92ba0784ff1f7A19410bcf67BaAc5971dFa9CF1;
        address logic =
            deployRaw("mainnet/BKTreasury.sol:BKTreasury", EMPTY_ARGS);
        upgradeRaw(payable(proxy), logic, EMPTY_ARGS);

        console2.log("Logic", logic);
    }

    // function changeVault() public broadcast {
    //     IAuthority(0x3005775740fA97131036b6aBfe86fc2acd70f7F0).changeVault()
    // }

    // function setPrices() public broadcast {
    //     address[] memory tokens = new address[](1);
    //     tokens[0] = 0x4A8D59Baf30638Fa00aF210DAC3b78C3f1EBce54;
    //     uint256[] memory prices = new uint256[](1);
    //     prices[0] = 2_600_000_000_000_000_000;
    //     BKTreasury(payable(0xf92ba0784ff1f7A19410bcf67BaAc5971dFa9CF1))
    //         .updatePrices(tokens, prices);
    // }
}
