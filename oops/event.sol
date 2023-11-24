// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract EventCon {
    // for emit a data to frontend - react js / node js
    // like request response
    event show(string message,uint Price);

    function CallEvent() public  payable {
        emit show("hi", msg.value);
    }

}