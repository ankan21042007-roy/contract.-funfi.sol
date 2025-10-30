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
<img width="1920" height="1080" alt="Screenshot 2025-10-29 135542" src="https://github.com/user-attachments/assets/88ca0620-71d9-4bc4-bbe1-a393ebf216ba" />
Project Description
this project is build for the beginners learning solidiyty and celo block chain 
this program shows an output of Hello Blockchains
contract address-
0x0f732Cd0C83288d4E8d294A9B34558baAf166BA5