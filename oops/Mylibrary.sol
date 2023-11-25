// SPDX-License-Identifier: MIT

pragma solidity 0.8;

import "./library.sol";

contract demo {
    uint a = 10;
    uint b = 10;

    using MathLibrary for uint;


    function doAdd() public view returns (uint) {
        return a.add(b);
    }

      function doAdd2() public view returns (uint) {
        return MathLibrary.add(a,b);
    }
}
