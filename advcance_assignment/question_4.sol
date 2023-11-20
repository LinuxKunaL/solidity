// SPDX-License-Identifier: MIT
pragma solidity <0.9.1;

contract question_4 {
    int256[] arrayOfNum = [137, 24, 56, 12, 30];

    function name() public view returns (int256) {
        int256 a = 0;
        for (uint256 i = 0; i < arrayOfNum.length; i++) {
            if (arrayOfNum[i] > a) {
                a = arrayOfNum[i];
            }
        }
        return a;
    }
}
