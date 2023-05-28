// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Ownable {
    address public owner;

    constructor () {
        owner = msg.sender;
    }

    modifier ownerOnly () {
        require (msg.sender == owner, "You are not owner");
        _;
    }
}