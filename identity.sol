pragma solidity ^0.8.1;

contract Identity {

    string name;
    uint age;

   constructor() {
       name= "Arslan";
       age= 22;
    }

    function getName() public view returns (string memory) {
        return name;
    }

    function getAge () public view returns (uint) {
        return age;
    }

    function setAge() public {
        age=age+1;
    }

}