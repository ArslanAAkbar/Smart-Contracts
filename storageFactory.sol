// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "./simpleStorage.sol";

// EVM Ethereum Virtual Machine 
// Avalanche, Polygon, Fantom etc.

contract StorageFactory {

    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract () public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore (uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        //Address
        //ABI => Application Binary Interface
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        return simpleStorageArray[_simpleStorageIndex].retrive();
    }
}