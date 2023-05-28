pragma solidity ^0.8.0;


    // local variables are explain within function which are sotre in stack not directly in the blockchain


contract localVariables {

    // local variables but string is not a local variable it directly store in the contract and use blockchain storage
    //local variables are not required to gas fees 
    string name = "Arslan"; // state variable

    function local() pure public returns(uint){
        
        uint age = 12; //local variable

        // therefore if we want to initilize the string variable in the function or store in the stack we must use memory keyword

        string memory name= "Arslan "; //directetly not store in stacks use memory keyword

        return age;
    }

}