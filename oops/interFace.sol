// SPDX-License-Identifier: MIT
pragma solidity 0.8;

interface interfaceCon {
    // interface need to remove virtual keyword and make not implement
    function add(uint256 a, uint256 b) external returns (uint256);
}

contract Demo is interfaceCon {
    function add(uint256 a, uint256 b) public pure override returns (uint256) {
        return (a + b);
    }
}
