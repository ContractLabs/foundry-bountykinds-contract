// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// forgefmt: disable-start
import { 
    IBKStaking 
} from "../interfaces/IBKStaking.sol";
import { 
    SafeTransferLib 
} from "../libraries/SafeTransferLib.sol";
import {
    IBKStakingToken 
} from "../interfaces/IBKStakingToken.sol";
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
    ERC20Upgradeable 
} from "../oz-custom/oz-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import { 
    ReentrancyGuardUpgradeable 
} from "../oz-custom/oz-upgradeable/security/ReentrancyGuardUpgradeable.sol";
import { 
    EnumerableSetUpgradeable 
} from "../oz-custom/oz-upgradeable/utils/structs/EnumerableSetUpgradeable.sol";

import { 
    IFundForwarderUpgradeable 
} from "../oz-custom/internal-upgradeable/interfaces/IFundForwarderUpgradeable.sol";
// forgefmt: disable-end

contract BKStaking is
    IBKStaking,
    ManagerUpgradeable,
    BKFundForwarderUpgradeable,
    ReentrancyGuardUpgradeable
{
    using SafeTransferLib for *;
    using EnumerableSetUpgradeable for *;

    uint256 public constant MULTIPLER = 10_000;

    address public stakingToken;
    uint256 public totalStakes;
    mapping(address user => uint256) public stakedAmount;
    EnumerableSetUpgradeable.AddressSet private _rewardTokens;
    mapping(address rewardToken => uint256) private _rewardAmount;

    function initialize(IAuthority authority_) external initializer {
        __ReentrancyGuard_init();
        __Manager_init_unchained(authority_, Roles.PROXY_ROLE);
        __FundForwarder_init_unchained(
            IFundForwarderUpgradeable(address(authority_)).vault()
        );
    }

    function getCurrentRewards()
        external
        view
        returns (Reward[] memory rewards)
    {
        uint256 length = _rewardTokens.length();
        rewards = new Reward[](length);
        address rewardToken;
        for (uint256 i; i < length;) {
            rewardToken = _rewardTokens.at(i);
            rewards[i] = Reward(rewardToken, _rewardAmount[rewardToken]);
            unchecked {
                ++i;
            }
        }
    }

    function getStakerReward(address staker_)
        external
        view
        returns (Reward[] memory rewards)
    {
        uint256 length = _rewardTokens.length();
        rewards = new Reward[](length);
        uint256 staked = stakedAmount[staker_];
        uint256 interestRate = (staked * MULTIPLER) / totalStakes;
        address rewardToken;
        uint256 rewardAmount;
        for (uint256 i; i < length;) {
            rewardToken = _rewardTokens.at(i);
            // forgefmt: disable-next-line
            rewardAmount = (_rewardAmount[rewardToken] * interestRate) / MULTIPLER;
            rewards[i] = Reward(rewardToken, rewardAmount);
            unchecked {
                ++i;
            }
        }
    }

    function stake(uint256 amount_) external nonReentrant whenNotPaused {
        if (amount_ == 0) revert BKStaking__ZeroValue();
        address sender = _msgSender();
        SafeTransferLib.safeTransferFrom(
            stakingToken, sender, address(this), amount_
        );
        totalStakes += amount_;
        stakedAmount[sender] += amount_;
        emit Staked(sender, amount_);
    }

    function claimReward() external onlyWhitelisted {
        address sender = _msgSender();
        uint256 _stakedAmount = stakedAmount[sender];

        // update stored amount
        stakedAmount[sender] = 0;
        totalStakes -= _stakedAmount;
        IBKStakingToken(stakingToken).burn(address(this), _stakedAmount);

        uint256 length = _rewardTokens.length();
        uint256 interestRate = (_stakedAmount * MULTIPLER) / totalStakes;

        Reward[] memory rewards = new Reward[](length);
        address rewardToken;
        uint256 rewardAmount;
        for (uint256 i; i < length;) {
            rewardToken = _rewardTokens.at(i);
            // forgefmt: disable-next-line
            rewardAmount = (_rewardAmount[rewardToken] * interestRate) / MULTIPLER;
            SafeTransferLib.safeTransfer(rewardToken, sender, rewardAmount);
            rewards[i] = Reward(rewardToken, rewardAmount);
            unchecked {
                ++i;
            }
        }

        emit Claimed(sender, rewards);
    }

    function addReward(
        address rewardToken_,
        uint256 amount_
    )
        external
        onlyRole(Roles.TREASURER_ROLE)
    {
        SafeTransferLib.safeTransferFrom(
            rewardToken_, _msgSender(), address(this), amount_
        );
        _rewardTokens.add(rewardToken_);
        _rewardAmount[rewardToken_] += amount_;

        emit RewardAdded(rewardToken_, amount_);
    }

    function changeVault(address vault_)
        external
        override
        onlyRole(Roles.TREASURER_ROLE)
    {
        _changeVault(vault_);
    }

    function _beforeRecover(bytes memory)
        internal
        override
        whenPaused
        onlyRole(Roles.OPERATOR_ROLE)
    { }

    function _afterRecover(
        address,
        address,
        uint256,
        bytes memory
    )
        internal
        override
    { }
}
