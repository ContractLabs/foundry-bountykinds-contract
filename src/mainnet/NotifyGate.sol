// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// forgefmt: disable-start
import { INotifyGate } from "../interfaces/INotifyGate.sol";

import { ReentrancyGuard } from "../oz-custom/oz/security/ReentrancyGuard.sol";

import { FundForwarder, BKFundForwarder } from "../internal/BKFundForwarder.sol";

import { Roles, Manager, IAuthority } from "../oz-custom/presets/base/Manager.sol";

import { IWithdrawable } from "../oz-custom/internal/interfaces/IWithdrawable.sol";

import { IFundForwarder } from "../oz-custom/internal/interfaces/IFundForwarder.sol";

import { IERC721, ERC721TokenReceiver } from "../oz-custom/oz/token/ERC721/ERC721.sol";

import { IERC20, IERC20Permit } from "../oz-custom/oz/token/ERC20/extensions/IERC20Permit.sol";
// forgefmt: disable-end

contract NotifyGate is
    Manager,
    INotifyGate,
    ReentrancyGuard,
    BKFundForwarder,
    ERC721TokenReceiver
{
    constructor(IAuthority authority_)
        payable
        ReentrancyGuard()
        Manager(authority_, 0)
    {
        _changeVault(IFundForwarder(address(authority_)).vault());
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

    /// @inheritdoc INotifyGate
    function notifyWithNative(bytes calldata message_) external payable {
        _safeNativeTransfer(vault(), msg.value, "");
        emit Notified(_msgSender(), message_, address(0), msg.value);
    }

    function onERC721Received(
        address from_,
        address,
        uint256 tokenId_,
        bytes calldata message_
    )
        external
        override
        returns (bytes4)
    {
        address nft = _msgSender();
        IERC721(nft).safeTransferFrom(
            address(this), vault(), tokenId_, safeTransferHeader()
        );

        emit Notified(from_, message_, nft, tokenId_);

        return this.onERC721Received.selector;
    }

    /// @inheritdoc INotifyGate
    function notifyWithERC20(
        IERC20 token_,
        uint256 value_,
        uint256 deadline_,
        uint8 v,
        bytes32 r,
        bytes32 s,
        bytes calldata message_
    )
        external
        nonReentrant
    {
        address user = _msgSender();
        if (token_.allowance(user, address(this)) < value_) {
            IERC20Permit(address(token_)).permit(
                user, address(this), value_, deadline_, v, r, s
            );
        }

        address _vault = vault();

        _safeERC20TransferFrom(token_, user, _vault, value_);

        if (
            IWithdrawable(_vault).notifyERC20Transfer(
                address(token_), value_, safeTransferHeader()
            ) != IWithdrawable.notifyERC20Transfer.selector
        ) revert NofifyGate__ExecutionFailed();

        emit Notified(user, message_, address(token_), value_);
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
}
