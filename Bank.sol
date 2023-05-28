// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./Owner.sol";
import "./selfdestruct.sol";

contract Bank is Ownable, killMe {

    mapping (address => uint ) Balance;

    event balanceAdded (uint amount, address addedTo);
    event balanceTrasffered (address transferTo, uint amount );

    function deposit () public payable returns (uint) {
        Balance[msg.sender] += msg.value;
        emit balanceAdded (msg.value, msg.sender);
        return Balance[msg.sender];
    }

    function withdraw(uint amount) public {        

        require (Balance[msg.sender] >= amount, "You are not Owner" );
        
        payable (msg.sender).transfer(amount);
        
        Balance[msg.sender] -= amount;
    }

    function checkBalance() public view returns (uint){
        return Balance[msg.sender];
    }

    function totalBalance() public view returns (uint){
        return address(this).balance;
    }

    function transfer (address recipient, uint amount) payable public ownerOnly {
        require (Balance[msg.sender] >= amount, "Enough Balance" );
        require (msg.sender != recipient, "could not send, sender and receiver same on both sides" );

        uint previousSenderBalance = Balance[msg.sender];

        Balance[msg.sender] -= amount;
        Balance [recipient] += amount;

        assert (Balance[msg.sender] == previousSenderBalance - amount);
        emit balanceTrasffered (recipient, amount);
    }
}