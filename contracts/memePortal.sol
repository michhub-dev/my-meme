// SPDX-License-Identifier: UNLICENSED 

// solidity compiler version
pragma solidity ^0.8.0; 

import "hardhat/console.sol";

contract MemeContract {
    uint256 totalMemes; 

    uint256 private randNum;

event NewMeme(address indexed from, uint256 timestamp, string message); 

struct Memes {
    address sender;
    string message;
    uint256 timestamp;
}
Memes[] mem;

    constructor() payable {
        console.log("hey yo, How are you?");

        // @notice set the initial randNum 
        randNum = (block.timestamp + block.difficulty) % 100;
    }

    function meme(string memory _message) public {
        totalMemes += 1; 
        console.log("% has memed", msg.sender);
   mem.push(Memes(msg.sender, _message, block.timestamp));

// @notice generate a new seed for the next person that sends meme
   randNum = (block.difficulty + block.timestamp + randNum) % 100;

   console.log("Random number generated: %d", randNum);

// @notice give a 50% chance that the user wins the prize
   if (randNum <= 50) {
       console.log("you won!", msg.sender);
   
  

 // initiate a prize amount 
        uint256 ethAmount = 0.0001 ether; 

        //@notice ensure that the balance of the contract is bigger than the prize amount
        require(ethAmount <= address(this).balance, "hey, there's no much eth here");

        //@notice here we send the money
        (bool success, ) = (msg.sender).call{value: ethAmount}("");
        require(success, "Failed to withdraw money from contract");
    }

        emit NewMeme(msg.sender, block.timestamp, _message);
    }

    function getAllMemes() public view returns(Memes[] memory) {
    return mem;
    }
    function getTotalMemes() public view returns(uint256) {
        console.log("we have % total memes", totalMemes);
        return totalMemes;
    }
}