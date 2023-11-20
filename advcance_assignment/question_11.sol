// SPDX-License-Identifier: MIT
pragma solidity <0.9.0;

contract question_11 {
    struct student {
        string name;
        uint256 rollName;
        uint256 age;
    }

    mapping(uint256 => student) studentMap;

    function insert(
        string calldata _name,
        uint256 _rollNo,
        uint256 _age
    ) public {
        studentMap[_rollNo] = student(_name, _rollNo, _age);
    }

    function fetch(uint256 _rollNo) public view returns (student memory) {
        return studentMap[_rollNo];
    }
}
