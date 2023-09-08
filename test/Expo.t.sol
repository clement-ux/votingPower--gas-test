// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.20;

import "forge-std/Test.sol";

import {Expo} from "src/Expo.sol";

contract ExpoTest is Test {
    Expo public expo;

    function setUp() public {
        expo = new Expo();
    }

    // min gas cost: 1683
    // avg gas cost: 1683
    // med gas cost: 1683
    // max gas cost: 1683
    function test_GasComparisonExp() public view {
        // No gas diff between 0 and 200000000
        // Gas comparison doesn't work if done on a for loop. (IDK why)
        expo.powerExp(0);
        expo.powerExp(10);
        expo.powerExp(100);
        expo.powerExp(1000);
        expo.powerExp(10000);
        expo.powerExp(100000);
        expo.powerExp(1000000);
        expo.powerExp(10000000);
        expo.powerExp(100000000);
        expo.powerExp(200000000);
    }

    // min gas cost: 522
    // avg gas cost: 522
    // med gas cost: 522
    // max gas cost: 522
    function test_GasComparisonLin() public view {
        // No gas diff between 0 and 200000000
        // Gas comparison doesn't work if done on a for loop. (IDK why)
        expo.powerLin(0);
        expo.powerLin(10);
        expo.powerLin(100);
        expo.powerLin(1000);
        expo.powerLin(10000);
        expo.powerLin(100000);
        expo.powerLin(1000000);
        expo.powerLin(10000000);
        expo.powerLin(100000000);
        expo.powerLin(200000000);
    }

    // min gas cost: 548
    // avg gas cost: 592
    // med gas cost: 548
    // max gas cost: 834
    function test_GasComparisonStp() public view {
        // Gas comparison doesn't work if done on a for loop. (IDK why)
        expo.powerStp(0);
        expo.powerStp(10);
        expo.powerStp(100);
        expo.powerStp(1000);
        expo.powerStp(10000);
        expo.powerStp(100000);
        expo.powerStp(1000000);
        expo.powerStp(10000000);
        expo.powerStp(100000000);
        expo.powerStp(200000000);
    }

    // min gas cost: 2200
    // avg gas cost: 2200
    // med gas cost: 2200
    // max gas cost: 2200
    function test_GasComparisonPow() public view {
        // Gas comparison doesn't work if done on a for loop. (IDK why)
        expo.powerPow(0);
        expo.powerPow(10);
        expo.powerPow(100);
        expo.powerPow(1000);
        expo.powerPow(10000);
        expo.powerPow(100000);
        expo.powerPow(1000000);
        expo.powerPow(10000000);
        expo.powerPow(100000000);
        expo.powerPow(200000000);
    }
    // Formula exp:
    // 5/(1 + exp(5-1.5x)) + 5/(1+exp(5)))

    // Formula lin:
    // 5x/6

    // Formula stp:
    // 0.25x, if x < 2
    // (16x - 27)/10, if x < 4.5
    // (9 + x)/3, if x >= 4.5

    // Formula pow:
    // 1.5^(0.75x) - 1
}
