// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title IBKAsset
 * @dev This interface defines the methods and events for a contract that
 * manages a ERC20 token and allows executing
 * calls to external contracts.
 */
interface IBKAsset {
    /**
     * @dev Retrieves the type ID tracker for a given type ID.
     * @param typeId_ The type ID for which to retrieve the tracker.
     * @return The type ID tracker.
     */
    function typeIdTrackers(uint256 typeId_) external view returns (uint256);

    /**
     * @dev Retrieves metadata for a given token ID, including its type ID and
     * index.
     * @param tokenId_ The token ID for which to retrieve metadata.
     * @return typeId index The type ID and index of the specified token.
     */
    function metadataOf(uint256 tokenId_)
        external
        view
        returns (uint256 typeId, uint256 index);
}
