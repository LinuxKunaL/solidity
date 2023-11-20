// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract question_2 {
    bytes str1 = "kunfl";
    bytes str2 = "kunal";
    bool[] boolOfArray;

    function StringMatch() public {
        for (uint256 i = 0; i < str1.length; i++) {
            if (str1[i] == str2[i]) {
                boolOfArray.push(true);
            } else {
                boolOfArray.push(false);
            }
        }
    }

    function getArray() public view returns (bool) {
        for (uint256 i = 0; i < boolOfArray.length; i++) {
            if (boolOfArray[i] == false) {
                return false;
            }
        }
        return true;
    }

    // method 2

    function checkString() public view returns (bool) {
        return
            keccak256(abi.encodePacked(str1)) ==
            keccak256(abi.encodePacked(str2));
    }
}
