// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title IBountyKindsERC20
 * @dev This interface defines the methods and events for a contract that
 * manages a ERC20 token and allows executing
 * calls to external contracts.
 */
interface IBK20 {
    /**
     * @dev Mints tokens to the specified address.
     * @param to_ The address that will receive the tokens.
     * @param amount_ The amount of tokens to mint.
     */
    function mint(address to_, uint256 amount_) external;

    /**
     * @dev Burns tokens to the specified address.
     * @param from_ The address that will burn the tokens.
     * @param amount_ The amount of tokens to burn.
     */
    function burn(address from_, uint256 amount_) external;
}
