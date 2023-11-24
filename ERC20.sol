// SPDX-License-Identifier: MIT
pragma solidity 0.8;

/*
To make scracth ERC20 Token
    - define / make interface 
        - function : totalSupply () external view returns(uint)
        - function : balanceOf (address account) external view returns(uint)
        - function : transfer(address recipent , uint amount) external returns(bool)
        - function : allowance(address owner , address spender) external returns(uint)
        - function : approve(address spender,uint amount) external returns(bool)
        - function : transferForm(address sender , address recipent , uint amount) external returns(bool)

        - event : Transfer(address indexed from, address indexed to, uint value)
        - event : Approval(address indexed owner , address indexed spender , uint value)

    - make basic contact
        - make token name and symbol
        - define founder adr and name 
        - define decimal :  The decimals field in an ERC-20 token contract
                            defines how divisible a token can be . ex 0.00000000000001
                            divided into 10^18 smaller units

        - make balance mapping for store user balance with has address
        - totalSupply are total number of tokens that have been created 
        - make allowed mapping 
*/

interface ERC20 {
    // interfaces don't need any define to virtual keyword
    // interfaces use to make function that don't have any not implement

    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint256);

    function transfer(address recipent, uint256 amount) external returns (bool);

    function allowance(
        address owner,
        address spender
    ) external returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function transferForm(
        address sender,
        address recipent,
        uint256 amount
    ) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );

    /*
        indexed : means that the value of that parameter will be logged and can be used for efficient 
        filtering when querying for past events , retrieval of events when you need to filter them based
         on specific criteria
    */
}

contract Giga is ERC20 {
    string public name = "Giga";
    string public symbol = "GI";
    string public founderName = "kunal lokhande";
    address public founder;

    uint256 public decimal = 0;
    mapping(address => uint256) public balance;
    uint256 public totalSupply;
    mapping(address => mapping(address => uint256)) allowed;

    constructor() {
        totalSupply = 1000;
        founder = msg.sender;
        balance[founder] = totalSupply;
    }

    modifier CheckBalance(uint256 _amount) {
        require(_amount > 0, "amount must be greater then zero");
        require(balance[msg.sender] >= _amount, "you don't have balance");
        _;
    }

    function balanceOf(
        address _account
    ) public view override returns (uint256) {
        return balance[_account];
    }

    function transfer(
        address _recipent,
        uint256 _amount
    ) public override CheckBalance(_amount) returns (bool) {
        balance[msg.sender] -= _amount;
        balance[_recipent] += _amount;
        emit Transfer(msg.sender, _recipent, _amount);
        return true;
    }

    function allowance(
        address _owner,
        address _spender
    ) public view override returns (uint256) {
        return allowed[_owner][_spender];
    }

    function approve(
        address _spender,
        uint256 _amount
    ) public override CheckBalance(_amount) returns (bool) {
        allowed[msg.sender][_spender] = _amount;
        emit Approval(msg.sender, _spender, _amount);
        return true;
    }

    function transferForm(
        address _sender,
        address _recipent,
        uint256 _amount
    ) public override returns (bool) {
        require(
            allowed[_sender][_recipent] >= _amount,
            "recipent don't have authority to spend sender's token"
        );
        require(balance[_sender] >= _amount, "insufficent balance");

        balance[_sender] -= _amount;
        balance[_recipent] += _amount;
        emit Transfer(msg.sender, _recipent, _amount);
        return true;
    }
}
