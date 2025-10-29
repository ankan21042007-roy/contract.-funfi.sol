# contract.-funfi.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleContract {
    string public message;

    // Initialize with a default message
    constructor() {
        message = "Hello, Blockchain!";
    }

    // Public function to update the message
    function setMessage(string calldata newMessage) external {
        message = newMessage;
    }
}
