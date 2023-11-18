// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract twitter {
    struct TweetStruct {
        uint256 id;
        string message;
        address author;
    }

    mapping(uint256 => TweetStruct) mapTweet;
    uint256[] TweetsIds;

    function insertTweet(uint256 _id, string memory _message) public {
        mapTweet[_id] = TweetStruct(_id, _message, msg.sender);
        TweetsIds.push(_id);
    }

    function fetchTweet(uint256 _id) public view returns (TweetStruct memory) {
        return mapTweet[_id];
    }

    function fetchAllTweets() public view returns (TweetStruct[] memory) {
        TweetStruct[] memory ArrayOfStruct = new TweetStruct[](
            TweetsIds.length
        );

        for (uint256 i = 0; i < TweetsIds.length; i++) {
            ArrayOfStruct[i] = mapTweet[TweetsIds[i]];
        }

        return ArrayOfStruct;
    }
}
