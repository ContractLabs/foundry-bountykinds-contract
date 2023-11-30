// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import { DateTimeLib } from "src/libraries/DateTimeLib.sol";

contract Treasury {
    mapping(address => uint256) public limitTokenPerUser;
    mapping(address => uint256) public limitTokenPerDay;
    mapping(address => mapping(uint256 => uint256)) public
        tokenWithdrawedAmountPerDay;
    mapping(address => mapping(address => mapping(uint256 => uint256))) public
        userWithdrawedAmountPerDay;

    constructor() { }

    function setLimit(
        address token_,
        uint256 limitPerUser_,
        uint256 limitTokenPerDay_
    )
        external
    {
        limitTokenPerDay[token_] = limitTokenPerDay_;
        limitTokenPerUser[token_] = limitPerUser_;
    }

    function withdraw(
        address token_,
        address to_,
        uint256 value_,
        uint256 amount_
    )
        external
    {
        _beforeWithdraw(token_, to_, value_, amount_);
        (bool success,) = token_.call(
            abi.encodeWithSignature("transfer(address,uint256)", to_, amount_)
        );
        require(success);
    }

    function _configTimestamp(uint256 rawTimestamp_)
        public
        pure
        returns (uint256 configuredTimestamp)
    {
        (uint256 year, uint256 month, uint256 day,,,) =
            DateTimeLib.timestampToDateTime(rawTimestamp_);

        configuredTimestamp = DateTimeLib._daysFromDate(year, month, day)
            * DateTimeLib.SECONDS_PER_DAY;
    }

    function _beforeWithdraw(
        address token_,
        address to_,
        uint256 value_,
        uint256 amount_
    )
        internal
    {
        uint256 timestamp = _configTimestamp(block.timestamp);

        uint256 _limitTokenPerDay = limitTokenPerDay[token_];
        uint256 _limitTokenPerUser = limitTokenPerUser[token_];

        uint256 currentTokenWithdrawedAmount =
            tokenWithdrawedAmountPerDay[token_][timestamp];
        uint256 currentUserWithdrawedAmount =
            userWithdrawedAmountPerDay[token_][to_][timestamp];

        if (token_ == address(0)) {
            if ((currentTokenWithdrawedAmount + value_) > _limitTokenPerDay) {
                revert("The token exceeded the withdrawal limit.");
            }
            if ((currentUserWithdrawedAmount + value_) > _limitTokenPerUser) {
                revert("The user exceeded the withdrawal limit.");
            }
            tokenWithdrawedAmountPerDay[token_][timestamp] += value_;
            userWithdrawedAmountPerDay[token_][to_][timestamp] += value_;
        } else {
            if ((currentTokenWithdrawedAmount + amount_) > _limitTokenPerDay) {
                revert("The token exceeded the withdrawal limit.");
            }
            if ((currentUserWithdrawedAmount + amount_) > _limitTokenPerUser) {
                revert("The user exceeded the withdrawal limit.");
            }
            tokenWithdrawedAmountPerDay[token_][timestamp] += amount_;
            userWithdrawedAmountPerDay[token_][to_][timestamp] += amount_;
        }
    }
}
