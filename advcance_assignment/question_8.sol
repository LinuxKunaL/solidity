// SPDX-License-Identifier: MIT
pragma solidity <0.9.0;

contract question_8 {
    uint256[] array = [1, 2, 3, 5, 6, 6, 6];

    function sumArrayElement() public view returns (uint256) {
        uint256 sum;
        for (uint256 i = 0; i < array.length; ++i) {
            sum += array[i];
        }
        return sum;
    }
}
