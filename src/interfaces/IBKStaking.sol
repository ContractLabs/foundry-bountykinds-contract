// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

interface IBKStaking {
    error BKStaking__ZeroValue();
    error BKStaking__ZeroStaker();
    error BKStaking__UnsupportedToken();
    error BKStaking__InsufficientAmount();
    error BKStaking__WithdrawStakingToken();

    event Staked(address indexed user, uint256 stakeId, uint256 amount);
    event Unstaked(address indexed user, uint256 stakeId, uint256 amount);
    event RewardClaimed(address indexed user, uint256 stakeId, address rewardToken, uint256 reward);
    event RewardAdded(address rewardToken, uint256 amount);

    // read func

    // write func
    function stake(uint256 amount) external;
    function unstake(uint256 stakeId) external;
    function unstakeAll() external;
    function addReward(address rewardToken, uint256 amount) external;
    function setStakingToken(address token) external;

    struct Rewards {
        uint256 amount;
        uint256 lastUpdateTime;
    }

    struct StakeInfo {
        uint256 stakeTime;
        uint256 stakeAmount;
        mapping(address => uint256) paidRewards;
    }
}
