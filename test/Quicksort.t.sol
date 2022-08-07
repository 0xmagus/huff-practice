// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";

contract QuicksortTest is Test {
    Quicksort public quicksort;

    function setUp() public {
        quicksort = Quicksort(HuffDeployer.deploy("Quicksort"));
    }

    function testSort_FiveItems() public {
        uint256[] memory arr = new uint256[](5);
        arr[0] = 3;
        arr[1] = 1;
        arr[2] = 4;
        arr[3] = 5;
        arr[4] = 2;

        uint256[] memory results = quicksort.sort(arr);

        assertEq(results[0], 1);
        assertEq(results[1], 2);
        assertEq(results[2], 3);
        assertEq(results[3], 4);
        assertEq(results[4], 5);
        assertEq(results.length, 5);
    }

    function testSort_Empty() public {
        uint256[] memory arr = new uint256[](0);

        uint256[] memory results = quicksort.sort(arr);

        assertEq(results.length, 0);
    }

    function testSort_SingleItem() public {
        uint256[] memory arr = new uint256[](1);
        arr[0] = 0;

        uint256[] memory results = quicksort.sort(arr);

        assertEq(results[0], 0);
        assertEq(results.length, 1);
    }

    function testSort_Reverse() public {
        uint256[] memory arr = new uint256[](3);
        arr[0] = 3;
        arr[1] = 2;
        arr[2] = 1;

        uint256[] memory results = quicksort.sort(arr);

        assertEq(results[0], 1);
        assertEq(results[1], 2);
        assertEq(results[2], 3);
        assertEq(results.length, 3);
    }

    function testSort_Duplicate() public {
        uint256[] memory arr = new uint256[](5);
        arr[0] = 3;
        arr[1] = 3;
        arr[2] = 3;
        arr[3] = 1;
        arr[4] = 1;

        uint256[] memory results = quicksort.sort(arr);

        assertEq(results[0], 1);
        assertEq(results[1], 1);
        assertEq(results[2], 3);
        assertEq(results[3], 3);
        assertEq(results[4], 3);
        assertEq(results.length, 5);
    }
}

interface Quicksort {
    function sort(uint256[] calldata) external returns (uint256[] memory);
}
