pragma solidity ^0.8.13;

contract Deployer {

    function getDeployerAddress() public view returns (address) {
        address account;
        return account= msg.sender ;

    }
}