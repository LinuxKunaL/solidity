// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract question_1 {
    bytes str1 = "kunal";
    bytes str2 = "lokhande";

    function concatString() public view returns (string memory) {
        bytes memory OutPutstr = bytes.concat(str1, str2);
        return string(OutPutstr);
    }
}
