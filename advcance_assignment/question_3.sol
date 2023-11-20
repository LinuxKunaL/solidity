// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract question_3 {
    uint256[] arrayOfNum = [1, 2, 3, 4, 5, 6];

    function findNumber(uint256 item) public view returns (bool) {
        for (uint256 i = 0; i < arrayOfNum.length; i++) {
            if (arrayOfNum[i] == item) {
                return true;
            }
        }
        return false;
    }
}
