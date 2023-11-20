// SPDX-License-Identifier: MIT
pragma solidity <0.9.0;

contract question_6 {
    int256 temp;
    int256[5] array = [2, 3, 4, 5, 1];
    int256[5] rArray;

    function reverceArray() public {
        for (uint256 i = 0; i < array.length; ++i) {
            rArray[array.length - (i + 1)] = array[i];
        }
    }
}
