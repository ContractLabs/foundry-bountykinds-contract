// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {
    IERC20,
    IERC20Permit
} from "../oz-custom/oz/token/ERC20/extensions/IERC20Permit.sol";

import { IERC721 } from "../oz-custom/oz/token/ERC721/IERC721.sol";

import { ITreasury } from "../oz-custom/presets/interfaces/ITreasury.sol";

/**
 * @title ICommandGate
 * @dev Interface for the command gate, managing commands and interacting with
 * the treasury.
 */
interface ICommandGate {
    // Custom errors
    error CommandGate__ExecutionFailed();
    error CommandGate__InvalidArgument();
    error CommandGate__UnknownAddress(address);

    // Events
    event Whitelisted(address indexed addr);
    event VaultsWhitelisted(address[] vaults);
    event Commanded(
        address indexed to,
        bytes4 indexed functionSelector,
        bytes params,
        address indexed vault,
        address from,
        address token,
        uint256 value
    );

    /**
     * @dev Updates the treasury contract.
     * @param treasury_ The new treasury contract address.
     */
    function updateTreasury(ITreasury treasury_) external;

    /**
     * @dev Whitelists a given address.
     * @param addr_ The address to be whitelisted.
     */
    function whitelistAddress(address addr_) external;

    /**
     * @dev Deposits native tokens with a specified command.
     * @param contract_ The contract address.
     * @param vault_ The vault address.
     * @param fnSig_ The function signature.
     * @param params_ The parameters for the command.
     */
    function depositNativeTokenWithCommand(
        address contract_,
        address vault_,
        bytes4 fnSig_,
        bytes calldata params_
    )
        external
        payable;

    /**
     * @dev Deposits ERC-20 tokens with a specified command.
     * @param token_ The ERC-20 token address.
     * @param value_ The amount of tokens to deposit.
     * @param fnSig_ The function signature.
     * @param vault_ The vault address.
     * @param contract_ The contract address.
     * @param data_ Additional data for the command.
     */
    function depositERC20WithCommand(
        IERC20 token_,
        uint256 value_,
        bytes4 fnSig_,
        address vault_,
        address contract_,
        bytes memory data_
    )
        external;

    /**
     * @dev Deposits ERC-20 tokens with permit function and a specified command.
     * @param token_ The ERC-20 token with permit.
     * @param value_ The amount of tokens to deposit.
     * @param deadline_ The permit deadline.
     * @param v The recovery id.
     * @param r The R value of the signature.
     * @param s The S value of the signature.
     * @param fnSig_ The function signature.
     * @param vault_ The vault address.
     * @param contract_ The contract address.
     * @param data_ Additional data for the command.
     */
    function depositERC20PermitWithCommand(
        IERC20Permit token_,
        uint256 value_,
        uint256 deadline_,
        uint8 v,
        bytes32 r,
        bytes32 s,
        bytes4 fnSig_,
        address vault_,
        address contract_,
        bytes calldata data_
    )
        external;

    /**
     * @dev Deposits multiple ERC-721 tokens with a specified command.
     * @param tokenIds_ Array of ERC-721 token IDs.
     * @param contracts_ Array of ERC-721 token contracts.
     * @param data_ Array of additional data for the commands.
     */
    function depositERC721MultiWithCommand(
        uint256[] calldata tokenIds_,
        IERC721[] calldata contracts_,
        bytes[] calldata data_
    )
        external;

    /**
     * @dev Checks if a vault address is whitelisted.
     * @param addr_ The vault address to check.
     * @return A boolean indicating whether the vault is whitelisted.
     */
    function isVaultWhitelisted(address addr_) external view returns (bool);

    /**
     * @dev Checks if a target address is whitelisted.
     * @param addr_ The target address to check.
     * @return A boolean indicating whether the target is whitelisted.
     */
    function isTargetWhitelisted(address addr_) external view returns (bool);
}
