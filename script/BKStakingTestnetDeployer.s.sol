// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "./base/Migrator.s.sol";
import { BK20 } from "../src/mainnet/BK20.sol";
import { IAuthority, IBKStaking, BKStaking } from "../src/mainnet/BKStaking.sol";

contract BKStakingTestnetDeployer is Migrator {
    function deploy() public returns (address) {
        return deployProxyRaw(
            "BK20.sol:BK20",
            abi.encodeCall(
                BK20.initialize,
                (
                    IAuthority(0x3005775740fA97131036b6aBfe86fc2acd70f7F0),
                    0xf92ba0784ff1f7A19410bcf67BaAc5971dFa9CF1,
                    10_000_000,
                    "BountyKinds: Jail",
                    "BKJ"
                )
            )
        );

        // address staking = deployProxyRaw(
        //     "BKStaking.sol:BKStaking",
        //     abi.encodeCall(
        //         BKStaking.initialize,
        //         (IAuthority(0x3005775740fA97131036b6aBfe86fc2acd70f7F0), 0xfdBd5cfdE980BbDcA05B67908796ECb6c8Ca1574)
        //     )
        // );

        // console2.log("Token Jail contract: ", jail);
        // return jail;
        // console2.log("Staking contract: ", staking);
    }

    function upgradeStaking() public broadcast {
        address token = deploy();
        address logic = deployLogic("BKStaking.sol:BKStaking");
        upgradeTo(0x4fb5422a741aD9F0B92AB02d2418BC6C555ff69c, logic);
        IBKStaking(0x4fb5422a741aD9F0B92AB02d2418BC6C555ff69c).setStakingToken(token);
    }
}
