// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./migrations/BaseScript.s.sol";

import { RBK721 } from "src/RBK721.sol";

contract DeployScript is BaseScript {
    /**
     * * @dev For non-proxy deployment, the return value must be `address
     * deployment`,
     * * and for proxy deployment, it should be `address proxy, address
     * implementation, string memory kind`
     */
    function run() public returns (address implementation) {
        // returns (address deployment) {
        vm.startBroadcast(vm.envUint("DEPLOYER_PRIVATE_KEY"));
        //deployment = _deploySample();
        implementation = deployRaw(type(RBK721).name, _EMPTY_PARAMS); //_deployUUPS();
        vm.stopBroadcast();
    }
}
