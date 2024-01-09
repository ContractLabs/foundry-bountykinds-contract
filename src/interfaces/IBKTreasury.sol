// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title IBKTreasury
 * @dev Interface for interacting with the BKTreasury contract, which manages
 * payments and prices.
 */
interface IBKTreasury {
    // Custom errors
    error BKTreasury__LengthMismatch();
    error BKTreasury__UnsupportedToken();

    /**
     * @dev Emitted when payments are updated by the operator.
     * @param operator The address of the operator updating the payments.
     * @param payments The addresses to be updated.
     * @param statuses The statuses indicating whether the payments are
     * supported or not.
     */
    event PaymentsUpdated(
        address indexed operator, address[] payments, bool[] statuses
    );

    /**
     * @dev Emitted when token prices are updated by the operator.
     * @param operator The address of the operator updating the token prices.
     * @param tokens The addresses of the tokens to have their prices updated.
     * @param prices The updated prices corresponding to each token.
     */
    event PricesUpdated(
        address indexed operator, address[] tokens, uint256[] prices
    );

    /**
     * @dev Retrieves the price of a specified token.
     * @param token_ The address of the token.
     * @return The current price of the token.
     */
    function priceOf(address token_) external view returns (uint256);

    /**
     * @dev Checks if a specific token is supported for payments.
     * @param token_ The address of the token.
     * @return A boolean indicating whether the token is supported.
     */
    function supportedPayment(address token_) external view returns (bool);

    /**
     * @dev Retrieves an array of supported payment tokens.
     * @return An array containing addresses of supported payment tokens.
     */
    function viewSupportedPayments() external view returns (address[] memory);
}
