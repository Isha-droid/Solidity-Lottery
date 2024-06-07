// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    address public manager;
    address payable[] public participants;

    constructor() {
        manager = msg.sender;
    }

    receive() external payable {
        require(msg.value == 1 ether, "Must send exactly 1 ether");
        participants.push(payable(msg.sender));
    }

    function getBalance() public view returns (uint) {
        require(msg.sender == manager, "Only the manager can call this function");
        return address(this).balance;
    }

    function random() public view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, participants.length)));
    }

    function selectWinner() public {
        require(msg.sender == manager, "Only the manager can call this function");
        require(participants.length >= 3, "At least 3 participants required");

        uint r = random();
        uint index = r % participants.length;
        address payable winner = participants[index];
        
        winner.transfer(getBalance());
        participants= new address payable [](0);
        
    }
}
