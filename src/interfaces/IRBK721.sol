// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import { IBK721 } from "./IBK721.sol";

/**
 * @title IRBK721
 * @dev Interface for the RBK721 contract, extending IBK721 and adding
 * RBK721-specific functionalities.
 */
interface IRBK721 is IBK721 {
    // Custom errors
    error RBK721__Rented();
    error RBK721__Expired();
    error RBK721__InvalidSignature();

    /**
     * @dev Allows a user to rent an RBK721 token by setting user-specific
     * information.
     * @param user_ The address of the user renting the RBK721 token.
     * @param tokenId The ID of the RBK721 token to be rented.
     * @param expires_ The timestamp indicating the expiration of the user's
     * rental period.
     * @param deadline_ The deadline by which the transaction must be executed.
     * @param signature_ The signature for authentication.
     */
    function setUser(
        address user_,
        uint256 tokenId,
        uint64 expires_,
        uint256 deadline_,
        bytes calldata signature_
    )
        external;
}
