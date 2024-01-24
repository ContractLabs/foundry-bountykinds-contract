// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// forgefmt: disable-start
import { 
    IBK20 
} from "../interfaces/IBK20.sol";
import {
    IBKStaking
} from "../interfaces/IBKStaking.sol";
import { 
    SafeTransferLib 
} from "../libraries/SafeTransferLib.sol";
import {
    ERC165CheckerUpgradeable,
    BKFundForwarderUpgradeable
} from "../internal-upgradeable/BKFundForwarderUpgradeable.sol";
import {
    Roles,
    IAuthority,
    ManagerUpgradeable
} from "../oz-custom/presets-upgradeable/base/ManagerUpgradeable.sol";

import { 
    ReentrancyGuardUpgradeable 
} from "../oz-custom/oz-upgradeable/security/ReentrancyGuardUpgradeable.sol";
import { 
    EnumerableSetUpgradeable 
} from "../oz-custom/oz-upgradeable/utils/structs/EnumerableSetUpgradeable.sol";
import { 
    IFundForwarderUpgradeable 
} from "../oz-custom/internal-upgradeable/interfaces/IFundForwarderUpgradeable.sol";
import { 
    IERC20BurnableUpgradeable,
    ERC20BurnableUpgradeable
} from "../oz-custom/oz-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol";
import { 
    IERC20MetadataUpgradeable
} from "../oz-custom/oz-upgradeable/token/ERC20/extensions/IERC20MetadataUpgradeable.sol";
// forgefmt: disable-end

contract BKStaking is IBKStaking, ManagerUpgradeable, BKFundForwarderUpgradeable, ReentrancyGuardUpgradeable {
    using SafeTransferLib for *;
    using EnumerableSetUpgradeable for *;

    uint256 public constant MULTIPLIER = 10_000;
    uint256 public totalStakes;
    address public stakingToken;
    EnumerableSetUpgradeable.AddressSet private _rewardTokens;

    mapping(address => Rewards) private _globalRewards;
    mapping(address => EnumerableSetUpgradeable.UintSet) private _stakeIds;
    mapping(address => mapping(uint256 => StakeInfo)) private _stakeDetails;

    function initialize(IAuthority authority_, address stakingToken_) external initializer {
        __ReentrancyGuard_init();
        __Manager_init_unchained(authority_, 0);
        __FundForwarder_init_unchained(IFundForwarderUpgradeable(address(authority_)).vault());
        stakingToken = stakingToken_;
    }

    function getStakingInfo(
        address account,
        address rewardToken
    )
        external
        view
        returns (uint256 total, uint256 totalUserStakes, uint256 totalRewards)
    {
        uint256 length = _stakeIds[account].length();
        uint256 stakeId;

        for (uint256 i = 0; i < length;) {
            stakeId = _stakeIds[account].at(i);
            totalUserStakes += _stakeDetails[account][stakeId].stakeAmount;
            totalRewards += getRewards(account, stakeId, rewardToken);
            unchecked {
                ++i;
            }
        }
        return (totalStakes, totalUserStakes, totalRewards);
    }

    function getStakingDetails(
        address account,
        address rewardToken
    )
        external
        view
        returns (
            uint256[] memory ids,
            uint256[] memory stakeTimes,
            uint256[] memory stakeAmounts,
            uint256[] memory rewards,
            uint256[] memory occupancies
        )
    {
        uint256 total = totalStakes;
        uint256 length = _stakeIds[account].length();
        uint256 stakeId;
        uint256 stakeAmount;
        ids = new uint256[](length);
        stakeTimes = new uint256[](length);
        stakeAmounts = new uint256[](length);
        rewards = new uint256[](length);
        occupancies = new uint256[](length);
        for (uint256 i = 0; i < length;) {
            stakeId = _stakeIds[account].at(i);
            stakeAmount = _stakeDetails[account][stakeId].stakeAmount;
            ids[i] = stakeId;
            stakeTimes[i] = _stakeDetails[account][stakeId].stakeTime;
            stakeAmounts[i] = stakeAmount;
            rewards[i] = getRewards(account, stakeId, rewardToken);
            occupancies[i] = (stakeAmount * MULTIPLIER) / total;
            unchecked {
                ++i;
            }
        }
    }

    function getRewards(address account_, uint256 stakeId_, address rewardToken_) public view returns (uint256) {
        return (
            (
                _stakeDetails[account_][stakeId_].stakeAmount
                    * (_globalRewards[rewardToken_].amount - _stakeDetails[account_][stakeId_].paidRewards[rewardToken_])
            ) / (10 ** (18 - IERC20MetadataUpgradeable(rewardToken_).decimals())) / 1e18
        );
    }

    function globalRewards(address rewardToken_) external view returns (uint256) {
        return _globalRewards[rewardToken_].amount;
    }

    function setStakingToken(address token_) external onlyRole(Roles.TREASURER_ROLE) {
        stakingToken = token_;
    }

    function changeVault(address vault_) external override onlyRole(Roles.TREASURER_ROLE) {
        _changeVault(vault_);
    }

    function addReward(address rewardToken_, uint256 amount_) external onlyRole(Roles.TREASURER_ROLE) {
        if (totalStakes == 0) revert BKStaking__ZeroStaker();
        if (rewardToken_ == address(stakingToken)) revert BKStaking__WithdrawStakingToken();

        _rewardTokens.add(rewardToken_);
        uint256 rewardAmount = (amount_ * 1e18) / (10 ** IERC20MetadataUpgradeable(rewardToken_).decimals());
        _globalRewards[rewardToken_].amount += (rewardAmount * 1e18) / totalStakes;
        _globalRewards[rewardToken_].lastUpdateTime = block.timestamp;
        SafeTransferLib.safeTransferFrom(rewardToken_, _msgSender(), address(this), amount_);
        emit RewardAdded(rewardToken_, amount_);
    }

    function stake(uint256 amount_) external nonReentrant whenNotPaused {
        if (amount_ == 0) revert BKStaking__ZeroValue();

        address sender = _msgSender();
        uint256 stakeId = block.timestamp;

        SafeTransferLib.safeTransferFrom(stakingToken, sender, address(this), amount_);
        totalStakes += amount_;
        StakeInfo storage stakeDetail = _stakeDetails[sender][stakeId];
        stakeDetail.stakeTime = stakeId;
        stakeDetail.stakeAmount = amount_;

        uint256 length = _rewardTokens.length();
        address rewardToken;

        for (uint256 i = 0; i < length;) {
            rewardToken = _rewardTokens.at(i);
            stakeDetail.paidRewards[rewardToken] = _globalRewards[rewardToken].amount;
            unchecked {
                ++i;
            }
        }

        _stakeIds[sender].add(stakeId);

        emit Staked(sender, stakeId, amount_);
    }

    function unstake(uint256 stakeId_) external nonReentrant whenNotPaused onlyWhitelisted {
        address sender = _msgSender();
        if (_stakeDetails[sender][stakeId_].stakeAmount == 0) revert BKStaking__ZeroValue();
        _claim(sender, stakeId_);
        _unstake(sender, stakeId_);
    }

    function unstakeAll() external nonReentrant whenNotPaused onlyWhitelisted {
        address account = _msgSender();
        uint256 length = _stakeIds[account].length();

        for (uint256 i = 0; i < length;) {
            _claim(account, _stakeIds[account].at(i));
            _unstake(account, _stakeIds[account].at(i));
            unchecked {
                ++i;
            }
        }
    }

    function _unstake(address account_, uint256 stakeId_) internal {
        uint256 amount = _stakeDetails[account_][stakeId_].stakeAmount;
        _stakeDetails[account_][stakeId_].stakeAmount = 0;
        totalStakes -= amount;
        IERC20BurnableUpgradeable(stakingToken).burn(amount);
        _stakeIds[account_].remove(stakeId_);
        emit Unstaked(account_, stakeId_, amount);
    }

    function _claim(address account_, uint256 stakeId_) internal {
        StakeInfo storage stakeDetail = _stakeDetails[account_][stakeId_];
        uint256 length = _rewardTokens.length();
        uint256 rewards;
        address rewardToken;

        for (uint256 i = 0; i < length;) {
            rewardToken = _rewardTokens.at(i);
            rewards = getRewards(account_, stakeId_, rewardToken);
            stakeDetail.paidRewards[rewardToken] = _globalRewards[rewardToken].amount;
            if (rewards > 0) SafeTransferLib.safeTransfer(rewardToken, account_, rewards);
            emit RewardClaimed(account_, stakeId_, rewardToken, rewards);

            unchecked {
                ++i;
            }
        }
    }

    function _beforeRecover(bytes memory) internal override whenPaused onlyRole(Roles.OPERATOR_ROLE) { }

    function _afterRecover(address, address, uint256, bytes memory) internal override { }
}
