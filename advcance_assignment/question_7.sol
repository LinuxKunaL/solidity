// SPDX-License-Identifier: MIT
pragma solidity <0.9.0;

contract question_7 {
    uint256 temp;
    uint256[] array;

    function reverceArray(uint256 item, uint256 index) public {
        array[index] = item;
    }
}
