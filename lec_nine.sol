// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract MemoryAndStorage {
    mapping (uint => User ) users;

    struct User {
        uint id;
        uint balance;
    }

    function adUser (uint id, uint balance) public {
        users[id]= User (id, balance);
    }

    function updateBalance (uint id, uint balance) public {
        users[id].balance = balance;
    }

    function getBalance (uint id) public view returns (uint){
        return users[id].balance;
    }
}