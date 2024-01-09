// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// forgefmt: disable-start
import { 
    ITreasury 
} from "../oz-custom/presets-upgradeable/interfaces/ITreasury.sol";

import {
    IFundForwarderUpgradeable,
    FundForwarderUpgradeable
} from "../oz-custom/internal-upgradeable/FundForwarderUpgradeable.sol";

import { 
    ERC165CheckerUpgradeable 
} from "../oz-custom/oz-upgradeable/utils/introspection/ERC165CheckerUpgradeable.sol";
// forgefmt: disable-end

/**
 * @title BKFundForwarderUpgradeable
 * @dev Abstract contract extending FundForwarderUpgradeable with additional
 * features for BK-specific functionalities.
 */
abstract contract BKFundForwarderUpgradeable is FundForwarderUpgradeable {
    using ERC165CheckerUpgradeable for address;

    /**
     * @dev Retrieves the header for safeRecover functionality.
     * @return The header as bytes.
     */
    function safeRecoverHeader() public pure override returns (bytes memory) {
        /// @dev value is equal keccak256("SAFE_RECOVER_HEADER")
        return bytes.concat(
            bytes32(
                0x556d79614195ebefcc31ab1ee514b9953934b87d25857902370689cbd29b49de
            )
        );
    }

    /**
     * @dev Retrieves the header for safeTransfer functionality.
     * @return The header as bytes.
     */
    function safeTransferHeader() public pure override returns (bytes memory) {
        /// @dev value is equal keccak256("SAFE_TRANSFER")
        return bytes.concat(
            bytes32(
                0xc9627ddb76e5ee80829319617b557cc79498bbbc5553d8c632749a7511825f5d
            )
        );
    }

    /**
     * @dev Checks if the provided vault address is a valid Treasury contract.
     * @param vault_ The address of the vault.
     * @inheritdoc FundForwarderUpgradeable
     */
    function _checkValidAddress(address vault_)
        internal
        view
        virtual
        override
    {
        super._checkValidAddress(vault_);
        if (!vault_.supportsInterface(type(ITreasury).interfaceId)) {
            revert FundForwarder__InvalidArgument();
        }
    }
}
