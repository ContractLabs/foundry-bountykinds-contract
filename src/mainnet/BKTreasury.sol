// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// forgefmt: disable-start
import {DateTimeLib} from "../libraries/DateTimeLib.sol";

import {IBKTreasury} from "../interfaces/IBKTreasury.sol";

import {EnumerableSet} from "../oz-custom/oz/utils/structs/EnumerableSet.sol";

import {AggregatorV3Interface} from "chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

import {Roles, IAuthority, ERC165CheckerUpgradeable, IERC1155, TreasuryUpgradeable} from "../oz-custom/presets-upgradeable/TreasuryUpgradeable.sol";
// forgefmt: disable-end

contract BKTreasury is TreasuryUpgradeable, IBKTreasury {
    using ERC165CheckerUpgradeable for address;
    using EnumerableSet for EnumerableSet.AddressSet;

    AggregatorV3Interface public priceFeed;
    mapping(address => uint256) private __priceOf;
    EnumerableSet.AddressSet private __supportedPayments;

    mapping(address account => uint256 configuredTimestamp) public
        limitTokenPerUser;
    mapping(address token => uint256 configuredTimestamp) public
        limitTokenPerDay;
    mapping(address token => mapping(uint256 configuredTimestamp => uint256))
        public tokenWithdrawedAmountPerDay;
    mapping(
        address token
            => mapping(
                address account
                    => mapping(uint256 configuredTimestamp => uint256)
            )
    ) public userWithdrawedAmountPerDay;

    bytes32 private constant ADMIN =
        0x0000000000000000000000000000000000000000000000000000000000000000;

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

    /**
     * @dev Updates the prices of specified tokens and adds them to the list of
     * supported payments.
     * Only accessible by users with the TREASURER_ROLE.
     * @param tokens_ An array of token addresses to update.
     * @param prices_ An array of corresponding prices for the tokens.
     */
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

    /**
     * @dev Updates the status of specified payments (add or remove) and returns
     * the results.
     * Only accessible by users with the TREASURER_ROLE.
     * @param payments_ An array of payment addresses to update.
     * @param statuses_ An array of corresponding status (true for add, false
     * for remove) for the payments.
     * @return results An array indicating the success status of each update
     * operation.
     */
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

    /// @inheritdoc IBKTreasury
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

    /// @inheritdoc IBKTreasury
    function supportedPayment(address token_) external view returns (bool) {
        return __supportedPayments.contains(token_);
    }

    /// @inheritdoc IBKTreasury
    function viewSupportedPayments() external view returns (address[] memory) {
        return __supportedPayments.values();
    }

    /**
     * @dev Set daily and per-user limits for a specific token.
     * @param token_ The address of the token for which limits are set.
     * @param limitPerUser_ The maximum amount allowed per user in a day.
     * @param limitTokenPerDay_ The total daily limit for the specified token.
     * Requirements:
     * - The caller must have the ADMIN role.
     */
    function setLimit(
        address token_,
        uint256 limitPerUser_,
        uint256 limitTokenPerDay_
    )
        external
        onlyRole(ADMIN)
    {
        limitTokenPerDay[token_] = limitTokenPerDay_;
        limitTokenPerUser[token_] = limitPerUser_;
    }

    /**
     * @dev Configures a raw timestamp to the start of the day by extracting the
     * date
     * components and converting them back to a timestamp.
     * @param rawTimestamp_ The original timestamp to be configured.
     * @return configuredTimestamp The timestamp representing the start of the
     * day.
     */
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

    /**
     * @dev Performs pre-withdrawal checks and updates withdrawal records.
     *
     * This internal function is called before processing a withdrawal of
     * tokens.
     * It calculates and checks withdrawal limits based on the token type,
     * recipient,
     * and withdrawal amounts. If the withdrawal exceeds the specified limits,
     * the function reverts with appropriate error messages.
     *
     * @param token_ The address of the token being withdrawn.
     * @param to_ The address of the recipient.
     * @param value_ The withdrawal value (for ERC20 tokens).
     * @param amount_ The withdrawal amount (for ERC1155 tokens).
     *
     * Requirements:
     * - The token address must support the ERC1155 interface if `amount_` is
     * provided.
     * - The withdrawal amount must not exceed the daily limit for the token.
     * - The withdrawal amount for the user must not exceed the daily limit.
     */
    function _beforeWithdraw(
        address token_,
        address to_,
        uint256 value_,
        uint256 amount_ // for erc1155
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

        if (token_.supportsInterface(type(IERC1155).interfaceId)) {
            if ((currentTokenWithdrawedAmount + amount_) > _limitTokenPerDay) {
                revert("The token exceeded the withdrawal limit.");
            }
            if ((currentUserWithdrawedAmount + amount_) > _limitTokenPerUser) {
                revert("The user exceeded the withdrawal limit.");
            }
            tokenWithdrawedAmountPerDay[token_][timestamp] += amount_;
            userWithdrawedAmountPerDay[token_][to_][timestamp] += amount_;
        } else {
            if ((currentTokenWithdrawedAmount + value_) > _limitTokenPerDay) {
                revert("The token exceeded the withdrawal limit.");
            }
            if ((currentUserWithdrawedAmount + value_) > _limitTokenPerUser) {
                revert("The user exceeded the withdrawal limit.");
            }
            tokenWithdrawedAmountPerDay[token_][timestamp] += value_;
            userWithdrawedAmountPerDay[token_][to_][timestamp] += value_;
        }
    }

    uint256[43] private __gap;
}
