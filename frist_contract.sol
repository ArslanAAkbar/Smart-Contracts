// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.8.5;

interface InterfaceSecondContract {
    function helloWorld() external pure returns (string memory );
}

contract First {

    address secondAddress;

    function setSecondAddres(address _secondAddress) external {
        secondAddress = _secondAddress;
    }

    function callHelloWorld() external view returns (string memory) {
        InterfaceSecondContract c = InterfaceSecondContract (secondAddress);
        return c.helloWorld() ;
    }
}