// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

interface IBKStakingToken {
    /**
     * @dev Mints tokens to the specified address.
     * @param to_ The address that will receive the tokens.
     * @param amount_ The amount of tokens to mint.
     */
    function mint(address to_, uint256 amount_) external;

    /**
     * @dev Burn tokens to the specified address.
     * @param from_ The address that will receive the tokens.
     * @param amount_ The amount of tokens to mint.
     */
    function burn(address from_, uint256 amount_) external;
}
