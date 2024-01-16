// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// import { Test } from "forge-std/Test.sol";
// import { Treasury } from "test/mock/Treasury.sol";
// import { MockERC20 } from "test/mock/MockERC20.sol";

// contract BindingLimitTest is Test {
//     MockERC20 token;
//     Treasury treasury;

//     function setUp() public {
//         token = new MockERC20();
//         treasury = new Treasury();
//         token.mint(address(treasury), 1_000_000 ether);
//         treasury.setLimit(address(token), 100 ether, 1000 ether);
//     }

//     function test_withdrawWithBindingSuccess() public {
//         treasury.withdraw(address(token), vm.addr(1), 0, 100 ether);
//         assertEq(
//             token.balanceOf(address(treasury)), 1_000_000 ether - 100 ether
//         );
//     }

//     function test_withdrawWithBindingSuccessCase2() public {
//         treasury.withdraw(address(token), vm.addr(1), 0, 100 ether);
//         assertEq(
//             token.balanceOf(address(treasury)), 1_000_000 ether - 100 ether
//         );

//         vm.warp(block.timestamp + 86_900);
//         treasury.withdraw(address(token), vm.addr(1), 0, 100 ether);

//         assertEq(
//             token.balanceOf(address(treasury)), 1_000_000 ether - 200 ether
//         );
//     }

//     function test_withdrawWithBindingFailureCase1() public {
//         vm.expectRevert("The user exceeded the withdrawal limit.");
//         treasury.withdraw(address(token), vm.addr(2), 0, 101 ether);
//     }

//     function test_withdrawWithBindingFailureCase2() public {
//         treasury.withdraw(address(token), vm.addr(2), 0, 10 ether);
//         treasury.withdraw(address(token), vm.addr(2), 0, 10 ether);
//         treasury.withdraw(address(token), vm.addr(2), 0, 10 ether);
//         treasury.withdraw(address(token), vm.addr(2), 0, 10 ether);
//         treasury.withdraw(address(token), vm.addr(2), 0, 10 ether);
//         treasury.withdraw(address(token), vm.addr(2), 0, 10 ether);
//         treasury.withdraw(address(token), vm.addr(2), 0, 10 ether);
//         treasury.withdraw(address(token), vm.addr(2), 0, 10 ether);
//         treasury.withdraw(address(token), vm.addr(2), 0, 10 ether);
//         treasury.withdraw(address(token), vm.addr(2), 0, 10 ether);
//         vm.expectRevert("The user exceeded the withdrawal limit.");
//         treasury.withdraw(address(token), vm.addr(2), 0, 10 ether);
//     }

//     function test_withdrawWithBindingFailureCase3() public {
//         treasury.withdraw(address(token), vm.addr(1), 0, 100 ether);
//         treasury.withdraw(address(token), vm.addr(2), 0, 100 ether);
//         treasury.withdraw(address(token), vm.addr(3), 0, 100 ether);
//         treasury.withdraw(address(token), vm.addr(4), 0, 100 ether);
//         treasury.withdraw(address(token), vm.addr(5), 0, 100 ether);
//         treasury.withdraw(address(token), vm.addr(6), 0, 100 ether);
//         treasury.withdraw(address(token), vm.addr(7), 0, 100 ether);
//         treasury.withdraw(address(token), vm.addr(8), 0, 100 ether);
//         treasury.withdraw(address(token), vm.addr(9), 0, 100 ether);
//         treasury.withdraw(address(token), vm.addr(10), 0, 100 ether);
//         vm.expectRevert("The token exceeded the withdrawal limit.");
//         treasury.withdraw(address(token), vm.addr(11), 0, 10 ether);
//     }

//     function test_withdrawWithBindingSuccessCase4() public {
//         treasury.withdraw(address(token), vm.addr(1), 0, 100 ether);
//         assertEq(
//             token.balanceOf(address(treasury)), 1_000_000 ether - 100 ether
//         );

//         vm.warp(block.timestamp + 86_900);
//         treasury.withdraw(address(token), vm.addr(1), 0, 100 ether);

//         assertEq(
//             token.balanceOf(address(treasury)), 1_000_000 ether - 200 ether
//         );

//         vm.warp(block.timestamp + 1000);
//         vm.expectRevert("The user exceeded the withdrawal limit.");
//         treasury.withdraw(address(token), vm.addr(1), 0, 100 ether);
//     }
// }
