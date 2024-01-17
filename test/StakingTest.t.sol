// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import { console2, Test } from "forge-std/Test.sol";
import { MockERC20 } from "test/mock/MockERC20.sol";
import { IAuthority, IBKStaking, BKStaking } from "../src/mainnet/BKStaking.sol";

contract StakingTest is Test {
    event RewardAdded(address rewardToken, uint256 amount);
    event Staked(address indexed user, uint256 indexed amount);
    event Claimed(address indexed user, IBKStaking.Reward[] rewards);

    MockERC20 stakingToken;
    MockERC20 WBNB;
    MockERC20 USDC;

    address bob = vm.addr(1);
    address alice = vm.addr(2);
    address peter = vm.addr(3);
    address exploiter = vm.addr(4);

    address OPERATOR = 0x58f5663cCb305366F584b5f4dF523728D5479396;
    address TREASURER = 0xc065eE0cab9ecBD0B80f3a3cC219Acce441573c6;
    BKStaking staking;

    function _setUpUsers() internal pure returns (address[] memory users) {
        users = new address[](4);
        users[0] = 0x7E5F4552091A69125d5DfCb7b8C2659029395Bdf;
        users[1] = 0x2B5AD5c4795c026514f8317c7a215E218DcCD6cF;
        users[2] = 0x6813Eb9362372EEF6200f3b1dbC3f819671cBA69;
        users[3] = 0x1efF47bc3a10a45D4B230B5d10E37751FE6AA718;
    }

    function _setUpAmounts() internal pure returns (uint256[] memory amounts) {
        amounts = new uint256[](4);
        amounts[0] = 100_000_000_000_000_000_000;
        amounts[1] = 100_000_000_000_000_000_000;
        amounts[2] = 100_000_000_000_000_000_000;
        amounts[3] = 100_000_000_000_000_000_000;
    }

    function setUp() public {
        vm.createSelectFork(vm.envString("RPC_URL_BSC"));

        stakingToken = new MockERC20("BK: Yeild", "BKY", 18);
        WBNB = new MockERC20("Wrapped BNB", "WBNB", 18);
        USDC = new MockERC20("USD Coin", "USDC", 6);

        stakingToken.mintBulk(_setUpUsers(), _setUpAmounts());
        WBNB.mint(TREASURER, 100 ether);
        USDC.mint(TREASURER, 1 ether);

        vm.startPrank(OPERATOR, OPERATOR);
        staking = new BKStaking();
        staking.initialize(
            IAuthority(0x38E586659c83c7Ea2cBC7b796b08B8179EddEbC5),
            address(stakingToken)
        );
        vm.stopPrank();
    }

    function testStakeSuccess() public {
        vm.startPrank(bob, bob);
        stakingToken.approve(address(staking), 1 ether);
        vm.expectEmit();
        emit Staked(address(bob), 1 ether);
        staking.stake(1 ether);
        vm.stopPrank();

        console2.log("Current total staked: ", staking.totalStakes());
    }

    function testAddRewardSuccess() public {
        vm.startPrank(TREASURER, TREASURER);
        WBNB.approve(address(staking), 100 ether);
        vm.expectEmit();
        emit RewardAdded(address(WBNB), 100 ether);
        staking.addReward(address(WBNB), 100 ether);
        vm.stopPrank();
    }
}
