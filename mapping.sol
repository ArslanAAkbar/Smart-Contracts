pragma solidity ^0.8.1;

contract Mapping{


    mapping (address => uint) public testMapping ;

    function setBalance (address _addr, uint _x) public {
        testMapping [_addr] = _x;
    

    }
}