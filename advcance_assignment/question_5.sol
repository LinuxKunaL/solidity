// SPDX-License-Identifier: MIT
pragma solidity <0.9.0;

contract question_5 {
    int256 temp;

    function sortArray(int256[6] memory array)
        public
        returns (int256[6] memory)
    {
        for (uint256 i = 0; i < array.length; ++i) {
            for (uint256 j = 0; i < array.length - i - 1; j++) {
                if (array[j] > array[j + 1]) {
                    temp = array[j];
                    array[j] = array[j + 1];
                    array[j + 1] = temp;
                }
            }
        }
        return array;
    }
}
