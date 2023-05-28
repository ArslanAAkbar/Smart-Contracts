// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


contract ifels{

    function check(int a) public pure returns(string memory){
        string memory value;

        if(a>0){
            value="Value is greater than zero";
        }
        else if(a==0){
            value="Value is equal to zero";
        }
        else{
            value="Value is smaller then zero";
        }

        return value;
    }
}