// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    //━━━━━━━━━━━━━initialization━━━━━━━━━━━━━━━━━━//

    struct Candidate {
        uint256 id;
        string name;
        string party;
        string gender;
        uint256 age;
        address Address;
    }

    mapping(uint256 => Candidate) public candidateDetails;
    uint256 candidateId = 1;

    //━━━━━━━━━━━━━functions━━━━━━━━━━━━━━━━━━//

    function CandidateRegister(
        string calldata _name,
        string calldata _party,
        string calldata _gender,
        uint256 _age
    ) public {
        candidateDetails[candidateId] = Candidate(
            candidateId,
            _name,
            _party,
            _gender,
            _age,
            msg.sender
        );
        candidateId += 1;
    }

    // function CandidateVerification(params) {
       
    // }

}
