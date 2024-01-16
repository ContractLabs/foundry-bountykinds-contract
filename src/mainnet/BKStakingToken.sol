// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// forgefmt: disable-start
import { 
    IBKStakingToken
} from "../interfaces/IBKStakingToken.sol";
import {
    ERC165CheckerUpgradeable,
    BKFundForwarderUpgradeable
} from "../internal-upgradeable/BKFundForwarderUpgradeable.sol";
import {
    Roles,
    IAuthority,
    ManagerUpgradeable
} from "../oz-custom/presets-upgradeable/base/ManagerUpgradeable.sol";
import { 
    IFundForwarderUpgradeable 
} from "../oz-custom/internal-upgradeable/interfaces/IFundForwarderUpgradeable.sol";
import {
    ERC20Upgradeable,
    ERC20BurnableUpgradeable
} from "../oz-custom/oz-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol";
// forgefmt: disable-end

contract BKStakingToken is
    IBKStakingToken,
    ERC20Upgradeable,
    ManagerUpgradeable,
    ERC20BurnableUpgradeable,
    BKFundForwarderUpgradeable
{
    function initialize(
        IAuthority authority_,
        string calldata name_,
        string calldata symbol_
    )
        external
        initializer
    {
        __ERC20_init_unchained(name_, symbol_);
        __FundForwarder_init_unchained(
            IFundForwarderUpgradeable(address(authority_)).vault()
        );
        __Manager_init_unchained(authority_, Roles.PROXY_ROLE);
    }

    function mint(
        address to_,
        uint256 amount_
    )
        external
        onlyRole(Roles.MINTER_ROLE)
    {
        _mint(to_, amount_);
    }

    function burn(address from_, uint256 amount_) external {
        _burn(from_, amount_);
    }

    /**
     * @dev Allows only the treasurer to change the vault address.
     *
     * @param vault_ The new vault address.
     */
    function changeVault(address vault_)
        external
        override
        onlyRole(Roles.TREASURER_ROLE)
    {
        _changeVault(vault_);
    }

    function _beforeRecover(bytes memory)
        internal
        override
        whenPaused
        onlyRole(Roles.OPERATOR_ROLE)
    { }

    function _afterRecover(
        address,
        address,
        uint256,
        bytes memory
    )
        internal
        override
    { }

    function _beforeTokenTransfer(
        address from_,
        address to_,
        uint256 amount_
    )
        internal
        override(ERC20Upgradeable)
        onlyWhitelisted
    {
        super._beforeTokenTransfer(from_, to_, amount_);
    }
}
