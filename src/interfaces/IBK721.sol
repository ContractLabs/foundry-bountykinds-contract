// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import { IBKAsset } from "./IBKAsset.sol";

interface IBK721 is IBKAsset {
    /**
     * @dev Throws if the exchange request has already expired.
     */
    error BK721__Expired();
    /**
     * @dev Throws if the exchange request is not authorized.
     */
    error BK721__Unauthorized();
    /**
     * @dev Throws if the length of an array does not match the expected length.
     */
    error BK721__LengthMismatch();
    /**
     * @dev Throws if an execution fails.
     */
    error BK721__ExecutionFailed();
    /**
     * @dev Throws if the signature is invalid.
     */
    error BK721__InvalidSignature();
    /**
     * @dev Throws if the token is not supported.
     */
    error BK721__TokenNotSupported();

    /**
     * @dev Emitted when tokens are exchanged between two users.
     * @param sender The address of the sender.
     * @param forNFT The instance of IBK721.
     * @param forTypeId The type ID of the token.
     * @param forAmount The amount of tokens being exchanged.
     * @param senderNFTIds The token IDs being transferred.
     */
    event Exchanged(
        address indexed sender,
        IBK721 indexed forNFT,
        uint256 indexed forTypeId,
        uint256 forAmount,
        uint256[] senderNFTIds
    );

    /**
     * @dev Emitted when two or more NFTs are merged into a single NFT.
     * @param account The account to which the NFT is merged.
     * @param from The token IDs being merged.
     * @param to The token ID of the resulting merged NFT.
     */
    event Merged(address indexed account, uint256[] from, uint256 to);

    /**
     * @dev Emitted when tokens are redeemed by a user.
     * @param operator The address of the operator redeeming the tokens.
     * @param claimer The address of the user claiming the tokens.
     * @param typeId The type ID of the token.
     * @param amount The amount of tokens being redeemed.
     */
    event Redeemded(
        address indexed operator,
        address indexed claimer,
        uint256 indexed typeId,
        uint256 amount
    );

    /**
     * @dev Emitted when tokens are minted in bulk by an operator.
     * @param operator The address of the operator minting the tokens.
     * @param amount The amount of tokens being minted.
     * @param tos The addresses of the users receiving the tokens.
     */
    event BatchMinted(
        address indexed operator, uint256 indexed amount, address[] tos
    );

    /**
     * @dev Emitted when tokens are transferred in bulk from one user to
     * multiple users.
     * @param operator The address of the operator performing the transfer.
     * @param from The address of the user transferring the tokens.
     * @param nextId The next available token ID.
     */
    event BatchTransfered(
        address indexed operator, address indexed from, uint256 indexed nextId
    );

    /**
     * @dev Executes an exchange of assets, swapping BK721 tokens for another
     * asset type.
     * @param forNFT_ The BK721 contract for the NFTs to exchange.
     * @param forAmount_ The amount of BK721 tokens to exchange.
     * @param forTypeId_ The type ID of the tokens to receive in exchange.
     * @param nonce_ The nonce to prevent replay attacks.
     * @param deadline_ The deadline by which the transaction must be executed.
     * @param myIds_ An array of IDs to be exchanged.
     * @param signature_ The signature for authentication.
     * @return forIds An array of IDs received in exchange.
     */
    function exchangeAssets(
        IBK721 forNFT_,
        uint256 forAmount_,
        uint256 forTypeId_,
        uint256 nonce_,
        uint256 deadline_,
        uint256[] calldata myIds_,
        bytes calldata signature_
    )
        external
        returns (uint256[] memory forIds);

    /**
     * @dev Redeems a bulk amount of a specific asset type.
     * @param nonce_ The nonce to prevent replay attacks.
     * @param amount_ The amount to redeem.
     * @param typeId_ The type ID of the asset to redeem.
     * @param claimer_ The address claiming the redeemed assets.
     * @param deadline_ The deadline by which the transaction must be executed.
     * @param signature_ The signature for authentication.
     */
    function redeemBulk(
        uint256 nonce_,
        uint256 amount_,
        uint256 typeId_,
        address claimer_,
        uint256 deadline_,
        bytes calldata signature_
    )
        external;

    /**
     * @dev Transfers a batch of tokens from one address to multiple recipients.
     * @param from_ The address from which the tokens will be transferred.
     * @param tos_ An array of recipient addresses.
     * @param tokenIds_ An array of token IDs to be transferred.
     */
    function transferBatch(
        address from_,
        address[] calldata tos_,
        uint256[] calldata tokenIds_
    )
        external;

    /**
     * @dev Mints a single token and assigns it to a specified address.
     * @param to_ The address to which the minted token will be assigned.
     * @param tokenId_ The unique ID of the minted token.
     * @return tokenId The unique ID of the minted token.
     */
    function mint(
        address to_,
        uint256 tokenId_
    )
        external
        returns (uint256 tokenId);

    /**
     * @dev Safely mints a single token of a specified type and assigns it to a
     * specified address.
     * @param to_ The address to which the minted token will be assigned.
     * @param typeId_ The type ID of the minted token.
     * @return tokenId The unique ID of the minted token.
     */
    function safeMint(
        address to_,
        uint256 typeId_
    )
        external
        returns (uint256 tokenId);

    /**
     * @dev Mints multiple tokens of the same type and assigns them to multiple
     * addresses.
     * @param typeId_ The type ID of the minted tokens.
     * @param tos_ An array of addresses to which the minted tokens will be
     * assigned.
     */
    function mintBatch(uint256 typeId_, address[] calldata tos_) external;

    /**
     * @dev Safely mints multiple tokens of the same type and assigns them to a
     * specified address.
     * @param to_ The address to which the minted tokens will be assigned.
     * @param typeId_ The type ID of the minted tokens.
     * @param length_ The number of tokens to mint.
     * @return tokenIds An array of unique IDs for the minted tokens.
     */
    function safeMintBatch(
        address to_,
        uint256 typeId_,
        uint256 length_
    )
        external
        returns (uint256[] memory tokenIds);

    /**
     * @dev Merges multiple tokens into a single token.
     * @param fromIds_ An array of IDs to merge.
     * @param toId_ The ID of the token to merge into.
     * @param deadline_ The deadline by which the transaction must be executed.
     * @param signature_ The signature for authentication.
     */
    function merge(
        uint256[] calldata fromIds_,
        uint256 toId_,
        uint256 deadline_,
        bytes calldata signature_
    )
        external;

    /**
     * @dev Retrieves the nonce associated with a specific account.
     * @param account_ The address of the account.
     * @return The nonce value for the account.
     */
    function nonces(address account_) external view returns (uint256);

    /**
     * @dev Retrieves the nonce bitmap for a specific account and nonce value.
     * @param account_ The address of the account.
     * @param nonce_ The nonce value.
     * @return bitmap The nonce bitmap.
     * @return isDirtied A boolean indicating whether the nonce bitmap is
     * dirtied.
     */
    function nonceBitMaps(
        address account_,
        uint256 nonce_
    )
        external
        view
        returns (uint256 bitmap, bool isDirtied);

    /**
     * @dev Invalidates a specific nonce for a given account.
     * @param account_ The address of the account.
     * @param wordPos_ The position of the word in the bitmap.
     * @param mask_ The mask to invalidate the nonce.
     */
    function invalidateNonce(
        address account_,
        uint248 wordPos_,
        uint256 mask_
    )
        external;

    /**
     * @dev Retrieves the next available ID for tokens of a specific type.
     * @param typeId_ The type ID.
     * @return The next available token ID for the specified type.
     */
    function nextIdFromType(uint256 typeId_) external view returns (uint256);

    /**
     * @dev Retrieves the base URI for token metadata.
     * @return The base URI.
     */
    function baseURI() external view returns (string memory);

    /**
     * @dev Sets the base URI for token metadata.
     * @param baseURI_ The new base URI.
     */
    function setBaseURI(string calldata baseURI_) external;
}
