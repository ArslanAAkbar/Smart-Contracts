

pragma solidity ^0.8.2;

contract demo {

    uint num;

    function setNo(uint _number) public {
        num = _number;
    }

    function getNo() public view returns (uint) {
        return num;
    }


}