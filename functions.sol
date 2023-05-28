pragma solidity ^0.8.0;

contract Functions {

    uint public age = 10;


    function getter () public view returns(uint) {
       return age;
    } 

    function setter(uint newAge) public {
        age=newAge;
    }



}