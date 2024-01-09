// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// forgefmt: disable-start
import "../oz-custom/oz/token/ERC20/IERC20.sol";

import {
    IERC721,
    ERC721TokenReceiver
} from "../oz-custom/oz/token/ERC721/ERC721.sol";

import { 
    IERC20Permit 
} from "../oz-custom/oz/token/ERC20/extensions/draft-IERC20Permit.sol";
// forgefmt: disable-end

/**
 * @title INotifyGate
 * @dev Interface for the NotifyGate contract, managing notification-related
 * functionalities.
 */
interface INotifyGate {
    // Custom error
    error NofifyGate__ExecutionFailed();

    /**
     * @dev Emitted when a notification is successfully executed.
     * @param sender The address initiating the notification.
     * @param message The content of the notification.
     * @param token The address of the token involved in the notification (if
     * applicable).
     * @param value The value associated with the notification (if applicable).
     */
    event Notified(
        address indexed sender,
        bytes indexed message,
        address indexed token,
        uint256 value
    );

    /**
     * @dev Notifies the gate with a native token.
     * @param message_ The content of the notification.
     */
    function notifyWithNative(bytes calldata message_) external payable;

    /**
     * @dev Notifies the gate with an ERC20 token.
     * @param token_ The ERC20 token used for the notification.
     * @param value_ The value associated with the notification.
     * @param deadline_ The deadline by which the transaction must be executed.
     * @param v The recovery id.
     * @param r The R value of the signature.
     * @param s The S value of the signature.
     * @param message_ The content of the notification.
     */
    function notifyWithERC20(
        IERC20 token_,
        uint256 value_,
        uint256 deadline_,
        uint8 v,
        bytes32 r,
        bytes32 s,
        bytes calldata message_
    )
        external;
}
