// SPDX-License-Identifier: MIT
pragma solidity <=0.9.0;

contract wallet {
    address ToAddress;

    modifier checkAddressIsNotEmpry() {
        require(
            ToAddress != 0x0000000000000000000000000000000000000000,
            "Enter a 'ToAddres'"
        );
        _;
    }

    function setToAddress(address _To) public {
        ToAddress = _To;
    }

    function getBalanceOfUser()
        public
        view
        checkAddressIsNotEmpry
        returns (uint256)
    {
        return payable(ToAddress).balance;
    }

    function transferEth() public payable checkAddressIsNotEmpry {
        payable(ToAddress).transfer(msg.value);
    }
}
