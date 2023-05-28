// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Array {

    uint[] public numbers;

    function addElement(uint num) public {
        numbers.push(num);
    }

    function size() public view returns(uint) {
        return numbers.length;
    }

    function remove(uint index) public {
        delete numbers[index];
    } 

    
 



}