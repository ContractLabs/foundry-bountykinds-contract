// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "./base/Migrator.s.sol";
import {
    IAuthority,
    AggregatorV3Interface,
    BKTreasury
} from "../src/mainnet/BKTreasury.sol";
import { Gacha } from "../src/mainnet/Gacha.sol";

contract MigrateScript is Migrator {
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

    // function upgradeTreasury() public broadcast {
    //     address proxy = 0xe5a3777Eb96DE2EF8B8A1A42D839CDB1BDaAa591;
    //     upgradeRaw(
    //         payable(proxy),
    //         0x47036cA77D748d32703EeE9A2A20FD5f4d6b953C,
    //         EMPTY_ARGS
    //     );
    // }

    // function deployLogic() public broadcast {
    //     address logic =
    //         deployRaw("mainnet/BKTreasury.sol:BKTreasury", EMPTY_ARGS);
    //     console2.log("Logic", logic);
    // }

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

    // function testWithdraw() public {
    //     IFundForwarderUpgradeable.RecoveryCallData[] memory calldatas =
    //         new IFundForwarderUpgradeable.RecoveryCallData[](1);
    //     calldatas[0] = IFundForwarderUpgradeable.RecoveryCallData(
    //         0xe5a3777Eb96DE2EF8B8A1A42D839CDB1BDaAa591,
    //         0,
    //         bytes4(0xf37e8d38),
    //         abi.encode(
    //             0x3e098C23DCFBbE0A3f468A6bEd1cf1a59DC1770D,
    //             0x3F579e98e794B870aF2E53115DC8F9C4B2A1bDA6,
    //             1 ether,
    //             EMPTY_ARGS
    //         )
    //     );
    //     bytes[] memory data = new bytes[](1);

    //     data[0] = abi.encodeCall(IAuth.pause, ());
    //     // data[1] = abi.encodeCall(IFundForwarderUpgradeable.recover,
    //     // (calldatas));
    //     // data[2] = abi.encodeCall(IAuth.unpause, ());
    //     vm.prank(
    //         0x58f5663cCb305366F584b5f4dF523728D5479396,
    //         0x58f5663cCb305366F584b5f4dF523728D5479396
    //     );
    //     address[] memory targets = new address[](1);
    //     targets[0] = 0x38E586659c83c7Ea2cBC7b796b08B8179EddEbC5;
    //     // targets[1] = 0x635fCe835Ae164364245B1B4638aE7118399A887;
    //     // targets[2] = 0x38E586659c83c7Ea2cBC7b796b08B8179EddEbC5;

    //     IMulticall(0x2a76A0dc5E2Ee7a93d87936581c90932d4204aAb).exec(
    //         targets, data
    //     );

    //     vm.prank(
    //         0x3F579e98e794B870aF2E53115DC8F9C4B2A1bDA6,
    //         0x3F579e98e794B870aF2E53115DC8F9C4B2A1bDA6
    //     );
    //     IFundForwarderUpgradeable(0x635fCe835Ae164364245B1B4638aE7118399A887)
    //         .recover(calldatas);
    // }

    function upgradeGacha() public broadcast {
        address proxy = 0x635fCe835Ae164364245B1B4638aE7118399A887;
        address logic = deployRaw("mainnet/Gacha.sol:Gacha", EMPTY_ARGS);
        upgradeTo(proxy, logic);
    }
}
