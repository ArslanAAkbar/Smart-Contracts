// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.8.5;

interface ICounter {

    function count() external view returns (uint);
    function increment() external ;
}

contract callInterface {

    uint public count;

    function user(address _address) external{
        ICounter (_address).increment();
        count = ICounter (_address).count();
    }
}