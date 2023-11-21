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
        require(
            CandidateVerification(msg.sender),
            "account is already exist !!"
        );

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

    function CandidateVerification(address _sender)
        private
        view
        returns (bool)
    {
        for (uint256 i = 0; i <= candidateId; i++) {
            if (candidateDetails[i].Address == _sender) {
                return false;
            }
        }
        return true;
    }

    function CandidateList() public view returns (Candidate[] memory) {
        Candidate[] memory array = new Candidate[](candidateId - 1);
        for (uint256 i = 1; i < candidateId; i++) {
            array[i - 1] = candidateDetails[i];
        }
        return array;
    }
}
