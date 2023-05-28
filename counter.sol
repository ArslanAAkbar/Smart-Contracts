pragma solidity ^0.8.1;

contract counter {

    uint public count;

    function increment() public {
        count += 1 ;

    }

    function decrement() public {
        count -= 1 ;

    }
}