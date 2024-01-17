// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { IProxy } from "./Interfaces.sol";
import { console2, BaseScript } from "./Base.s.sol";
import { ERC1967Proxy } from
    "../../lib/openzeppelin-contracts/contracts/proxy/ERC1967/ERC1967Proxy.sol";

abstract contract Migrator is BaseScript {
    bytes internal EMPTY_ARGS;

    function deployRaw(
        string memory filename,
        bytes memory args
    )
        public
        returns (address deployed)
    {
        vm.resumeGasMetering();
        deployed = deployCode(filename, args);
        vm.pauseGasMetering();
    }

    function deployLogic(string memory filename)
        public
        returns (address deployed)
    {
        deployed = deployRaw(filename, EMPTY_ARGS);
    }

    function upgradeToAndCall(
        address proxy,
        address logic,
        bytes memory args
    )
        public
    {
        vm.resumeGasMetering();
        IProxy(proxy).upgradeToAndCall(logic, args);
        vm.pauseGasMetering();
    }

    function upgradeTo(address proxy, address logic) public {
        vm.resumeGasMetering();
        IProxy(proxy).upgradeTo(logic);
        vm.pauseGasMetering();
    }

    function deployProxyRaw(
        string memory filename,
        bytes memory args
    )
        public
        returns (address proxy)
    {
        address logic = deployRaw(filename, EMPTY_ARGS);
        // forgefmt: disable-next-line
        proxy = deployRaw("ERC1967/ERC1967Proxy.sol:ERC1967Proxy", abi.encode(logic, args));
    }
}
