// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Lottery {
    address public manager;
    address payable[] public participents; 
    
    constructor () {
        manager = msg.sender;
    }

    receive() external payable {
        require(msg.value == 2 ether, "Ether value must be 2");
        participents.push(payable(msg.sender));
    }

    function getBalance() public view returns (uint){
        require (msg.sender == manager, "You are not the Manager");
        return address(this).balance;
    }

    function random() public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, participents.length)));
    }

    function selectWinner () public {
        require (msg.sender == manager, "Not Allowed");
        require (participents.length >= 3, "Participents not completed");
        uint r = random();
        address payable winner;
        uint index = r % participents.length;
        winner = participents[index];
        winner.transfer(getBalance());
        participents = new address payable[](0);      
    }
}