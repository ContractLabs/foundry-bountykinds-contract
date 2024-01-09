// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// forgefmt: disable-start
import { 
    IERC721PermitUpgradeable 
} from "../oz-custom/oz-upgradeable/token/ERC721/extensions/IERC721PermitUpgradeable.sol";
// forgefmt: disable-end

/**
 * @title IMarketplace
 * @dev Interface for the Marketplace contract, managing marketplace-related
 * functionalities.
 */
interface IMarketplace {
    // Custom errors
    error Marketplace__Expired();
    error Marketplace__UnsupportedNFT();
    error Marketplace__ExecutionFailed();
    error Marketplace__InvalidSignature();
    error Marketplace__UnsupportedPayment();

    /**
     * @dev Represents a seller's information for a marketplace listing.
     * @param tokenId The ID of the NFT being sold.
     * @param deadline The deadline by which the transaction must be executed.
     * @param unitPrice The unit price of the NFT.
     * @param payment The address of the payment token.
     * @param nft The interface of the ERC721 contract for the NFT.
     * @param signature The signature for authentication.
     */
    struct Seller {
        uint256 tokenId;
        uint256 deadline;
        uint256 unitPrice;
        address payment;
        IERC721PermitUpgradeable nft;
        bytes signature;
    }

    /**
     * @dev Represents a buyer's information for a marketplace transaction.
     * @param v The recovery id.
     * @param r The R value of the signature.
     * @param s The S value of the signature.
     * @param deadline The deadline by which the transaction must be executed.
     */
    struct Buyer {
        uint8 v;
        bytes32 r;
        bytes32 s;
        uint256 deadline;
    }

    // Events
    event ProtocolFeeUpdated(
        address indexed operator, uint256 indexed feeFraction
    );
    event Redeemed(
        address indexed buyer, address indexed seller, Seller sellerItem
    );
    event TokensWhitelisted(address indexed operator, address[] tokens);

    /**
     * @dev Retrieves the nonce associated with a specific account.
     * @param account_ The address of the account.
     * @return The nonce value for the account.
     */
    function nonces(address account_) external view returns (uint256);

    /**
     * @dev Sets the protocol fee fraction for the marketplace.
     * @param feeFraction_ The fraction of the transaction amount to be charged
     * as a protocol fee.
     */
    function setProtocolFee(uint256 feeFraction_) external;

    /**
     * @dev Redeems an NFT from the marketplace.
     * @param deadline_ The deadline by which the transaction must be executed.
     * @param buyer_ The buyer's information for the transaction.
     * @param seller_ The seller's information for the listing.
     * @param signature_ The signature for authentication.
     */
    function redeem(
        uint256 deadline_,
        Buyer calldata buyer_,
        Seller calldata seller_,
        bytes calldata signature_
    )
        external
        payable;
}
