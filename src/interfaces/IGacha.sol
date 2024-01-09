// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title IGacha
 * @dev Interface for the Gacha contract, handling gacha-related
 * functionalities.
 */
interface IGacha {
    // Custom errors
    error Gacha__Expired();
    error Gacha__Unauthorized();
    error Gacha__InvalidTicket();
    error Gacha__InvalidPayment();
    error Gacha__PurchasedTicket();
    error Gacha__InvalidSignature();
    error Gacha__InsufficientAmount();

    /**
     * @dev Represents a gacha ticket.
     * @param account The account that owns the ticket.
     * @param isUsed A boolean indicating whether the ticket has been used.
     */
    struct Ticket {
        address account;
        bool isUsed;
    }

    // Events
    event Rewarded(
        address indexed operator,
        uint256 indexed ticketId,
        address indexed token,
        uint256 value
    );
    event Redeemed(
        address indexed account,
        uint256 indexed ticketId,
        uint256 indexed typeId
    );
    event TicketPricesUpdated(
        address indexed operator,
        uint256 indexed typeId,
        address[] supportedPayments,
        uint96[] unitPrices
    );

    /**
     * @dev Updates the ticket price for a specific gacha type.
     * @param typeId_ The type ID of the gacha.
     * @param supportedPayments An array of supported payment tokens.
     * @param unitPrices_ An array of corresponding unit prices for each payment
     * token.
     */
    function updateTicketPrice(
        uint256 typeId_,
        address[] calldata supportedPayments,
        uint96[] calldata unitPrices_
    )
        external;

    /**
     * @dev Redeems a gacha ticket for a specific user.
     * @param user_ The address of the user redeeming the ticket.
     * @param token_ The payment token used for redemption.
     * @param value_ The value of the payment token.
     * @param id_ The ID of the gacha ticket.
     * @param type_ The type of the gacha.
     */
    function redeemTicket(
        address user_,
        address token_,
        uint256 value_,
        uint256 id_,
        uint256 type_
    )
        external;

    /**
     * @dev Claims a reward associated with a gacha ticket.
     * @param token_ The reward token.
     * @param ticketId_ The ID of the gacha ticket.
     * @param value_ The value of the reward.
     * @param deadline_ The deadline by which the transaction must be executed.
     * @param signature_ The signature for authentication.
     */
    function claimReward(
        address token_,
        uint256 ticketId_,
        uint256 value_,
        uint256 deadline_,
        bytes calldata signature_
    )
        external;

    /**
     * @dev Retrieves the nonce associated with a specific gacha ticket.
     * @param ticketId_ The ID of the gacha ticket.
     * @return The nonce value for the gacha ticket.
     */
    function nonces(uint256 ticketId_) external view returns (uint256);
}
