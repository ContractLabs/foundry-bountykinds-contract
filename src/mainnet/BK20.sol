// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// forgefmt: disable-start
import {
    IBK20
} from "../interfaces/IBK20.sol";
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
    ERC20PermitUpgradeable
} from "../oz-custom/oz-upgradeable/token/ERC20/extensions/ERC20PermitUpgradeable.sol";
import { 
    IERC20BurnableUpgradeable,
    ERC20BurnableUpgradeable
} from "../oz-custom/oz-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol";
// forgefmt: disable-end

contract BK20 is
    IBK20,
    ERC20Upgradeable,
    ManagerUpgradeable,
    ERC20PermitUpgradeable,
    ERC20BurnableUpgradeable,
    BKFundForwarderUpgradeable
{
    function initialize(
        IAuthority authority_,
        address recipient_,
        uint256 initialSupply_,
        string calldata name_,
        string calldata symbol_
    )
        external
        initializer
    {
        __ERC20Permit_init(name_);
        __ERC20_init_unchained(name_, symbol_);
        __Manager_init_unchained(authority_, 0);
        __FundForwarder_init_unchained(IFundForwarderUpgradeable(address(authority_)).vault());
        _mint(recipient_, initialSupply_ * 1 ether);
    }

    /// @inheritdoc IBK20
    function mint(address to_, uint256 amount_) external onlyRole(Roles.MINTER_ROLE) {
        _mint(to_, amount_);
    }
    /**
     * @dev Allows only the treasurer to change the vault address.
     *
     * @param vault_ The new vault address.
     */

    function changeVault(address vault_) external override onlyRole(Roles.TREASURER_ROLE) {
        _changeVault(vault_);
    }

    function _beforeRecover(bytes memory) internal override whenPaused onlyRole(Roles.OPERATOR_ROLE) { }

    function _afterRecover(address, address, uint256, bytes memory) internal override { }

    function _beforeTokenTransfer(
        address from_,
        address to_,
        uint256 amount_
    )
        internal
        override(ERC20Upgradeable)
        whenNotPaused
        onlyWhitelisted
    {
        super._beforeTokenTransfer(from_, to_, amount_);
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC20Upgradeable) returns (bool) { }

    uint256[50] private __gap;
}
