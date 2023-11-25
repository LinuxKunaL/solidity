// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract demo {
    error insuffcientBalance(uint balance );

    function text(uint _balance) public pure {
        if (_balance<0) {
            revert insuffcientBalance(_balance);
        }
    }
}