// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract Books {
    mapping(string => string) books;

    constructor(string memory bookCat, string memory name) {
        books[bookCat] = name;
    }

    function fetchBooks(string calldata BookCat)
        public
        view
        returns (string memory)
    {
        return books[BookCat];
    }

}

contract demo {
    Books objectOfBooks = new Books("funny", "hii");

    function getBooks() public view returns (string memory) {
        return objectOfBooks.fetchBooks("funny");
    }
}
