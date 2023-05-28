pragma solidity ^0.8.0;

contract arry {

    uint[] public arr;

    function pushElement(uint item) public {
        arr.push(item);
        
    }

    function len() public view returns(uint) {
        return arr.length;

    }

    function popElement() public {
        arr.pop();
    }
}