// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// forgefmt: disable-start
import {IBKTreasury} from "src/interfaces/IBKTreasury.sol";

import {EnumerableSet} from "src/oz-custom/oz/utils/structs/EnumerableSet.sol";

import {Roles, IAuthority, TreasuryUpgradeable} from "src/oz-custom/presets-upgradeable/TreasuryUpgradeable.sol";

import {AggregatorV3Interface} from "chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

import {DateTimeLib} from "src/libraries/DateTimeLib.sol";

// forgefmt: disable-end

contract BKTreasury is TreasuryUpgradeable, IBKTreasury {
    using EnumerableSet for EnumerableSet.AddressSet;

    AggregatorV3Interface public priceFeed;
    mapping(address => uint256) private __priceOf;
    EnumerableSet.AddressSet private __supportedPayments;

    mapping(address => uint256) public limitTokenPerUser;
    mapping(address => uint256) public limitTokenPerDay;
    mapping(address => mapping(uint256 => uint256)) public
        tokenWithdrawedAmountPerDay;
    mapping(address => mapping(address => mapping(uint256 => uint256))) public
        userWithdrawedAmountPerDay;

    function initialize(
        string calldata name_,
        IAuthority authority_,
        AggregatorV3Interface priceFeed_
    )
        external
        initializer
    {
        priceFeed = priceFeed_;
        __Treasury_init(authority_, name_);
    }

    function updatePrices(
        address[] calldata tokens_,
        uint256[] calldata prices_
    )
        external
        onlyRole(Roles.TREASURER_ROLE)
    {
        uint256 length = tokens_.length;
        if (length != prices_.length) revert BKTreasury__LengthMismatch();

        for (uint256 i; i < length;) {
            __priceOf[tokens_[i]] = prices_[i];
            __supportedPayments.add(tokens_[i]);
            unchecked {
                ++i;
            }
        }

        emit PricesUpdated(_msgSender(), tokens_, prices_);
    }

    function updatePayments(
        address[] calldata payments_,
        bool[] calldata statuses_
    )
        external
        onlyRole(Roles.TREASURER_ROLE)
        returns (bool[] memory results)
    {
        uint256 length = payments_.length;
        if (length != statuses_.length) revert BKTreasury__LengthMismatch();

        results = new bool[](length);
        for (uint256 i; i < length;) {
            results[i] = statuses_[i]
                ? __supportedPayments.add(payments_[i])
                : __supportedPayments.remove(payments_[i]);

            unchecked {
                ++i;
            }
        }

        emit PaymentsUpdated(_msgSender(), payments_, statuses_);
    }

    function priceOf(address token_) external view returns (uint256 usdPrice) {
        if (token_ == address(0)) {
            AggregatorV3Interface _priceFeed = priceFeed;
            (, int256 usdUnit,,,) = _priceFeed.latestRoundData();
            return (uint256(usdUnit) * 1 ether) / (10 ** _priceFeed.decimals());
        }
        if ((usdPrice = __priceOf[token_]) == 0) {
            revert BKTreasury__UnsupportedToken();
        }
    }

    function supportedPayment(address token_) external view returns (bool) {
        return __supportedPayments.contains(token_);
    }

    function viewSupportedPayments() external view returns (address[] memory) {
        return __supportedPayments.values();
    }

    function setLimit(
        address token_,
        uint256 limitPerUser_,
        uint256 limitTokenPerDay_
    )
        external
        onlyRole(Roles.OPERATOR_ROLE)
    {
        limitTokenPerDay[token_] = limitTokenPerDay_;
        limitTokenPerUser[token_] = limitPerUser_;
    }

    function _configTimestamp(uint256 rawTimestamp_)
        internal
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
        override
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

    uint256[43] private __gap;
}
