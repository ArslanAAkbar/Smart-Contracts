// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0; // compiler version

contract SimpleStorage { //contract name

    // <- these means comments in the code that will never compile
    
    uint256 favoriteNumber; //uint256, bool, byte32, string these are type of variable
    
    mapping(string => uint256) public nameToFavoriteNumber; //mapping like dictionary 
    
    struct People{ // structs like object
        string name;
        uint256 favoriteNumber;
    }
    
    //array
    //uint256[] public favoratNumber
    People[] public people;
    
    //addstorage simple function
    function store(uint _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }
    
    //pure, view
    function retrive() public view returns (uint256){
        return favoriteNumber;
    }
    
    //calldata, stroage, memory
    function adPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_name, _favoriteNumber));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}