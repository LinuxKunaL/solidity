// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract Books {

    function Funny() public pure returns (string memory) {
        string memory name = "Tietam Brown";
        return name;
    }

    function Spiritual() public pure returns (string memory) {
        string memory name = "The Alchemist";
        return name;
    }

    function Improment() public pure returns (string memory) {
        string memory name = "Can't Hurt Me";
        return name;
    }

    function Java() public pure returns (string memory) {
        string memory name = "Head First Java";
        return name;
    }
}

contract demo {
    Books objectOfBooks = new Books();

    function getBooks() public view returns (string memory) {
        return objectOfBooks.Java();
    }
}
