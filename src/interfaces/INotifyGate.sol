// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// forgefmt: disable-start
import "src/oz-custom/oz/token/ERC20/IERC20.sol";

import {
    IERC721,
    ERC721TokenReceiver
} from "src/oz-custom/oz/token/ERC721/ERC721.sol";

import { 
    IERC20Permit 
} from "src/oz-custom/oz/token/ERC20/extensions/draft-IERC20Permit.sol";
// forgefmt: disable-end

interface INotifyGate {
    error NofifyGate__ExecutionFailed();

    event Notified(
        address indexed sender,
        bytes indexed message,
        address indexed token,
        uint256 value
    );

    function notifyWithNative(bytes calldata message_) external payable;

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
