// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.8.5;

contract Counter {
    uint public count;

    function increment () external {
        count += 1;
    }

    function decrement () external  {
        count -=1;
    }

}