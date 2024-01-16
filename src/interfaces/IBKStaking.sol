// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

interface IBKStaking {
    error BKStaking__ZeroValue();
    error BKStaking__UnsupportedToken();

    event Claimed(address indexed user, Reward[] rewards);
    event RewardAdded(address rewardToken, uint256 amount);
    event Staked(address indexed user, uint256 indexed amount);

    // read func
    function getStakerReward(address staker)
        external
        returns (Reward[] memory rewards);
    function getCurrentRewards() external returns (Reward[] memory rewards);

    // write func
    function claimReward() external;
    function stake(uint256 amount) external;
    function addReward(address rewardToken, uint256 amount) external;

    struct Reward {
        address rewardToken;
        uint256 rewardAmount;
    }
}
