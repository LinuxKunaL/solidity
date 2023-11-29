// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract Dao {
    // making struct

    struct Proposal {
        uint256 id;
        string description;
        uint256 amount;
        address payable receipient;
        uint256 votes;
        uint256 end;
        bool isExecuted;
    }

    // making mapping
 
    mapping(address => bool) private isInvestor;
    mapping(address => uint256) public numOfshares;
    mapping(address => mapping(uint256 => bool)) public isVoted;
    mapping(address => mapping(address => bool)) public withdrawlStatus;
    address[] public investorList;
    mapping(uint256 => Proposal) public proposals;

    // making uints

    uint256 public totalsShares;
    uint256 public availableFunds;
    uint256 public contributionTimeEnd;
    uint256 public nextProposalId;
    uint256 public voteTime;
    uint256 public quorum;
    address public manager;

    constructor(
        uint256 _contributionTimeEnd,
        uint256 _voteTime,
        uint256 _quorum
    ) {
        require(_quorum > 0 && _quorum < 100, "not valid value");
        contributionTimeEnd = block.timestamp + (_contributionTimeEnd * 3600);
        voteTime = _voteTime;
        quorum = _quorum;
        manager = msg.sender;
    }

    modifier onlyInvestor() {
        require(isInvestor[msg.sender] == true, "you are not an investor");
        _;
    }
    modifier onlyManager() {
        require(manager == msg.sender, "you are not a manager");
        _;
    }

    function contribution() public payable {
        require(contributionTimeEnd >= block.timestamp, "time is over");
        require(msg.value > 0, "send more than 0 ether");
        isInvestor[msg.sender] = true;
        numOfshares[msg.sender] += msg.value;
        totalsShares += msg.value;
        availableFunds += msg.value;
        investorList.push(msg.sender);
    }

    function reedemShare(uint256 _amount) public onlyInvestor {
        require(
            numOfshares[msg.sender] >= _amount,
            "you don't have enough sheres"
        );
        require(availableFunds >= _amount, "not enough funds");
        numOfshares[msg.sender] -= _amount;

        if (numOfshares[msg.sender] == 0) {
            isInvestor[msg.sender] = false;
        }

        availableFunds -= _amount;
        payable(msg.sender).transfer(_amount);
    }

    function transferShare(uint256 _amount, address _to) public onlyInvestor {
        require(
            numOfshares[msg.sender] >= _amount,
            "you don't have enough sheres"
        );
        require(availableFunds >= _amount, "not enough funds");

        numOfshares[msg.sender] -= _amount;
        if (numOfshares[msg.sender] == 0) {
            isInvestor[msg.sender] = false;
        }
        numOfshares[_to] += _amount;
        isInvestor[_to] = true;
        investorList.push(_to);
    }

    function createProposal(
        string calldata _description,
        uint256 _amount,
        address payable _resceipient
    ) public onlyManager {
        require(availableFunds >= _amount, "not enough funds");
        proposals[nextProposalId] = Proposal(
            nextProposalId,
            _description,
            _amount,
            _resceipient,
            0,
            block.timestamp + voteTime,
            false
        );
        nextProposalId++;
    }

    function voteProposal(uint256 _proposalId) public onlyInvestor {
        Proposal storage proposal = proposals[_proposalId];
        require(
            isVoted[msg.sender][_proposalId] == false,
            "you have already voted this proposal"
        );
        require(proposal.end >= block.timestamp, "voting Time ended");
        require(proposal.isExecuted == false, "It is already executed");

        isVoted[msg.sender][_proposalId] = true;
        proposal.votes += numOfshares[msg.sender];
    }

    function executeProposal(uint256 _proposalId) public onlyManager {
        Proposal storage proposal = proposals[_proposalId];
        require(
            ((proposal.votes * 100) / totalsShares) >= quorum,
            "majority does not support"
        );
        proposal.isExecuted = true;
        availableFunds -= proposal.amount;
        _transfer(proposal.amount, proposal.receipient);
    }

    function _transfer(uint256 _amount, address payable _receipient) private  {
        _receipient.transfer(_amount);
    }

    // mapping to array
    function ProposalLists() public view returns (Proposal[] memory) {
        Proposal[] memory array = new Proposal[](nextProposalId - 1);
        for (uint256 i = 1; i < nextProposalId; i++) {
            array[i] = proposals[i];
        }
        return array;
    }
}
