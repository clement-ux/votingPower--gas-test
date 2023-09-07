// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.20;

import "forge-std/Test.sol";

import {Expo} from "src/Expo.sol";

contract ExpoTest is Test {
    Expo public expo;

    function setUp() public {
        expo = new Expo();
    }

    function test_GasComparisonBewteenExpAndLin() public {
        for (uint256 i = 1; i < 6 * 365 days;) {
            uint256 resLin = expo.powerLin(i);
            uint256 resExp = expo.powerExp(i);
            uint256 resStp = expo.powerStp(i);
            assertGe(resLin, 0);
            assertGe(resExp, 0);
            assertGe(resStp, 0);
            assertLe(resLin, 5 * 1e18);
            assertLe(resExp, 5 * 1e18);
            assertLe(resStp, 5 * 1e18);
            console.log(i);
            i = i == 1 ? 2 : i * 3 / 2;
        }
    }

    // Formula exp:
    // 5/(1 + exp(5-1.5x)) + 5/(1+exp(5)))

    // Formula lin:
    // 5x/6

    // Formula stp:
    // 0.25x, if x < 2
    // (16x - 27)/10, if x < 4.5
    // (9 + x)/3, if x >= 4.5
}
