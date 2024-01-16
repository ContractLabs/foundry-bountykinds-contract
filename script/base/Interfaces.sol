// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IProxy {
    function upgradeTo(address implementation) external;

    function upgradeToAndCall(
        address implementation,
        bytes calldata data
    )
        external;
}

interface IScript {
    function run(bytes calldata args) external;
}
