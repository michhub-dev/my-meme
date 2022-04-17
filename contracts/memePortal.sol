// SPDX-License-Identifier: UNLICENSED 

// solidity compiler version
pragma solidity ^0.8.0; 

import "hardhat/console.sol";

contract MemeContract {
    uint256 totalMemes; 

event NewMeme(address indexed from, uint256 timestamp, string message); 

struct Memes {
    address sender;
    string message;
    uint256 timestamp;
}
Memes[] mem;

    constructor() payable {
        console.log("hey yo, How are you?");
    }

    function meme(string memory _message) public {
        totalMemes += 1; 
        console.log("% has memed", msg.sender);
   mem.push(Memes(msg.sender, _message, block.timestamp));
  
        emit NewMeme(msg.sender, block.timestamp, _message);

 // initiate a prize amount 
        uint256 ethAmount = 0.0001 ether; 

        //@notice ensure that the balance of the contract is bigger than the prize amount
        require(ethAmount <= address(this).balance, "hey, there's no much eth here");

        //@notice here we send the money
        (bool success, ) = (msg.sender).call{value: ethAmount}("");
        require(success, "Failed to withdraw money from contract");
    }

    function getTotalMemes() public view returns(uint256) {
        console.log("we have % total memes", totalMemes);
        return totalMemes;
    }
}