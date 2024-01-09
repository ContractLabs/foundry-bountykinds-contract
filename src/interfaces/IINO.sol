// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title IINO
 * @dev Interface for the Initial NFT Offering (INO) contract, managing
 * INO-related functionalities.
 */
interface IINO {
    // Custom errors
    error INO__Unauthorized();
    error INO__OnGoingCampaign();
    error INO__InsuficcientAmount();
    error INO__AllocationExceeded();
    error INO__ExternalCallFailed();
    error INO__UnsupportedPayment(address);
    error INO__CampaignEndedOrNotYetStarted();

    /**
     * @dev Represents a campaign for an Initial NFT Offering.
     * @param start The start timestamp of the campaign.
     * @param limit The user buy limit for the campaign.
     * @param nft The address of the associated NFT contract.
     * @param end The end timestamp of the campaign.
     * @param maxSupply The maximum supply of NFTs for the campaign.
     * @param typeNFT The type of NFT associated with the campaign.
     * @param usdPrice The price of the NFT in USD.
     * @param payments An array of supported payment tokens.
     */
    struct Campaign {
        uint64 start;
        uint32 limit; // user buy limit
        address nft;
        uint64 end;
        uint64 maxSupply;
        uint128 typeNFT;
        uint96 usdPrice;
        address[] payments;
    }

    /**
     * @dev Represents a ticket for the Initial NFT Offering.
     * @param paymentToken The payment token used for the ticket.
     * @param campaignId The ID of the associated campaign.
     * @param amount The amount of NFTs in the ticket.
     */
    struct Ticket {
        address paymentToken;
        uint256 campaignId;
        uint256 amount;
    }

    /**
     * @dev Emitted when a user registers for an Initial NFT Offering (INO)
     * campaign.
     * @param user The address of the user who registered.
     * @param erc721 The address of the associated ERC721 contract.
     * @param tokenIds An array of token IDs registered by the user.
     * @param price The total price paid by the user for the registered tokens.
     */
    event Registered(
        address indexed user,
        address indexed erc721,
        uint256[] tokenIds,
        uint256 price
    );

    /**
     * @dev Emitted when a user redeems an INO ticket.
     * @param buyer The address of the user who redeemed the ticket.
     * @param ticketId The ID of the redeemed INO ticket.
     * @param paymentToken The address of the payment token used for redemption.
     * @param total The total value paid by the buyer for the redemption.
     */
    event Redeemed(
        address indexed buyer,
        uint256 indexed ticketId,
        address indexed paymentToken,
        uint256 total
    );

    /**
     * @dev Emitted when an address receives an NFT.
     * @param from The address from which the NFT was received.
     * @param to The address receiving the NFT.
     * @param tokenId The ID of the received NFT.
     * @param data Any additional data associated with the NFT transfer.
     */
    event Received(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId,
        bytes data
    );

    /**
     * @dev Emitted when a new INO campaign is initiated.
     * @param campaignId The ID of the newly initiated campaign.
     * @param startAt The timestamp indicating the start of the campaign.
     * @param endAt The timestamp indicating the end of the campaign.
     */
    event NewCampaign(
        uint256 indexed campaignId, uint64 indexed startAt, uint64 indexed endAt
    );

    /**
     * @dev Calculates the ID of a ticket for a specific campaign and amount.
     * @param campaignId_ The ID of the campaign.
     * @param amount_ The amount of NFTs in the ticket.
     * @return The calculated ticket ID.
     */
    function ticketId(
        uint64 campaignId_,
        uint32 amount_
    )
        external
        pure
        returns (uint256);

    /**
     * @dev Redeems an INO ticket for a specific user.
     * @param user_ The address of the user redeeming the ticket.
     * @param token_ The payment token used for redemption.
     * @param value_ The value of the payment token.
     * @param ticketId_ The ID of the INO ticket.
     */
    function redeem(
        address user_,
        address token_,
        uint256 value_,
        uint256 ticketId_
    )
        external;

    /**
     * @dev Sets the details of a specific INO campaign.
     * @param campaignId_ The ID of the campaign.
     * @param campaign_ The details of the campaign.
     */
    function setCampaign(
        uint256 campaignId_,
        Campaign calldata campaign_
    )
        external;

    /**
     * @dev Retrieves the supported payment tokens for a specific campaign.
     * @param campaignId_ The ID of the campaign.
     * @return An array of supported payment tokens.
     */
    function paymentOf(uint256 campaignId_)
        external
        view
        returns (address[] memory);

    /**
     * @dev Retrieves the details of a specific INO campaign.
     * @param campaignId_ The ID of the campaign.
     * @return campaign_ The details of the campaign.
     */
    function campaign(uint256 campaignId_)
        external
        view
        returns (Campaign memory campaign_);
}
