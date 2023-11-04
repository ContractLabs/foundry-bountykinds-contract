// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title IBountyKindsERC20
 * @dev This interface defines the methods and events for a contract that manages a ERC20 token and allows executing
 * calls to external contracts.
 */
interface IBK20 {
    error BountyKindsERC20__Blacklisted();
    error BountyKindsERC20__InvalidArguments();

    /**
     * @dev Emitted when a refund is made to an operator.
     * @param operator The address of the operator that receives the refund.
     * @param refund The amount of tokens refunded.
     */
    event Refunded(address indexed operator, uint256 indexed refund);

    /**
     * @dev Emitted when a call to an external contract is executed.
     * @param operator The address of the operator that executed the call.
     * @param target The address of the external contract that was called.
     * @param value_ The amount of ether sent in the call.
     * @param callData The data sent in the call.
     * @param returnData The data returned by the external contract.
     */
    event Executed(
        address indexed operator, address indexed target, uint256 indexed value_, bytes callData, bytes returnData
    );

    /**
     * @dev Mints tokens to the specified address.
     * @param to_ The address that will receive the tokens.
     * @param amount_ The amount of tokens to mint.
     */
    function mint(address to_, uint256 amount_) external;

    /**
     * @dev Executes a call to an external contract.
     * @param target_ The address of the external contract to call.
     * @param value_ The amount of ether to send with the call.
     * @param calldata_ The data to send with the call.
     */
    function execute(address target_, uint256 value_, bytes calldata calldata_) external;
}
