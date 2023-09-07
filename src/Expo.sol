// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.20;

import "forge-std/Test.sol";

import "solmate/utils/SignedWadMath.sol";
import {FixedPointMathLib} from "solmate/utils/FixedPointMathLib.sol";

contract Expo {
    using FixedPointMathLib for uint256;

    uint256 public constant a = 33464254621424277;

    function powerExp(uint256 lockedTime) public pure returns (uint256) {
        return uint256(5 * FixedPointMathLib.WAD).divWadDown(
            FixedPointMathLib.WAD
                + uint256(wadExp(5 * int256(FixedPointMathLib.WAD) - 3 * int256(lockedTime.divWadDown(365 days * 2))))
        ) - a;
    }

    function powerLin(uint256 lockedTime) public pure returns (uint256) {
        return 5 * lockedTime.divWadDown(365 days * 6);
    }

    function powerStp(uint256 lockedTime) public pure returns (uint256) {
        uint256 x = lockedTime.divWadDown(365 days);
        if (x < (2 * 1e18)) return x / 4;
        if (2 * x < (9 * 1e18)) return (16 * x - 27 * 1e18) / 10;
        else return (9 * 1e18 + x) / 3;
    }
}
