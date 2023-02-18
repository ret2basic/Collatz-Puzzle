// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";
import {CollatzPuzzle} from "src/CollatzPuzzle.sol";

interface ICollatz {
  function collatzIteration(uint256 n) external pure returns (uint256);
}

contract CollatzPuzzleSolutionTest is Test {
    CollatzPuzzle public puzzle;
    ICollatz public solution;

    function setUp() public {
        // This is the caller
        puzzle = new CollatzPuzzle();
        // This is the callee
        solution = ICollatz(HuffDeployer.deploy("Solution"));
    }

    /// @dev Ensure that you can set and get the value.
    function testCallMe() public {
        address addr = address(solution);

        // Log Huff code size
        uint256 size;
        assembly {
            size := extcodesize(addr)
        }
        console.log("Code size: ", size);

        puzzle.callMe(addr);
    }
}
