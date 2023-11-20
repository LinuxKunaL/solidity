// SPDX-License-Identifier: MIT
pragma solidity <0.9.0;

contract question_9 {
    struct student {
        string name;
        uint256 rollName;
        uint256 age;
    }

    student public std;

    function insert(
        string calldata _name,
        uint256 _rollNo,
        uint256 _age
    ) public {
        std.name = _name;
        std.rollName = _rollNo;
        std.age = _age;
    }

    function fetch() public view returns (student memory) {
        return std;
    }
}
