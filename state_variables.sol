pragma solidity ^0.8.2;


// state variables are store directly in the blockchain and consume high gas fees

contract stateVariables {

    uint public age;

    //directly asign the value to variable 

    uint public number = 12;

    // one method to asign value to a variable is constructor method as below
    constructor () public {
        age=20;
    }

    // and other method is with function, asign the value to variable as below

    function setValue () public {

        age=25;
    }

}
