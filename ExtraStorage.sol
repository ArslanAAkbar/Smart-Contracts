// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "./simpleStorage.sol";

contract ExtraStorage is SimpleStorage {
    // override
    // vitual override 
    // and Inheritence

    // +5 store in favoriteNumbber using the function

    function store(uint _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 5;
    }
}