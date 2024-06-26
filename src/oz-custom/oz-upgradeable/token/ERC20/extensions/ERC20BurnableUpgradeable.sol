// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.5.0)
// (token/ERC20/extensions/ERC20Burnable.sol)

pragma solidity ^0.8.17;

import { IERC20Upgradeable, ERC20Upgradeable } from "../ERC20Upgradeable.sol";

interface IERC20BurnableUpgradeable is IERC20Upgradeable {
    function burn(uint256 amount) external;

    function burnFrom(address account, uint256 amount) external;
}

/**
 * @dev Extension of {ERC20} that allows token holders to destroy both their own
 * tokens and those that they have an allowance for, in a way that can be
 * recognized off-chain (via event analysis).
 */
abstract contract ERC20BurnableUpgradeable is
    ERC20Upgradeable,
    IERC20BurnableUpgradeable
{
    /**
     * @dev Destroys `amount` tokens from the caller.
     *
     * See {ERC20-_burn}.
     */
    function burn(uint256 amount) external virtual {
        _burn(_msgSender(), amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`, deducting from the caller's
     * allowance.
     *
     * See {ERC20-_burn} and {ERC20-allowance}.
     *
     * Requirements:
     *
     * - the caller must have allowance for ``accounts``'s tokens of at least
     * `amount`.
     */
    function burnFrom(address account, uint256 amount) external virtual {
        _spendAllowance(account, _msgSender(), amount);
        _burn(account, amount);
    }

    uint256[50] private __gap;
}
