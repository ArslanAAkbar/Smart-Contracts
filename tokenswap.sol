//"SPDX-License-Identifier: UNLICENSED"
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

/*interface IERC20 {

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom( address from, address to, uint256 amount ) external returns (bool);
}*/

contract TokenSwap {
    IERC20 public token1;
    address payable public owner1;
    IERC20 public token2;
    address payable public owner2;

    constructor ( address _token1, address payable _owner1, address _token2, address payable _owner2 ) {
        token1 = IERC20 (_token1);
        owner1 = _owner1;
        token2 = IERC20 (_token2);
        owner2 = _owner2;
    }

    function swap (uint _amount1, uint _amount2) public {
        require (msg.sender == owner1 || msg.sender == owner2, "You are not owner");
        require (token1.allowance(owner1, address(this)) >= _amount1, "Token 1 balance too low");
        require (token2.allowance(owner2, address(this)) >= _amount2, "Token 2 balance too low");

        //transfer token
        _safeTransferFrom(token1, owner1, owner2, _amount1);
        _safeTransferFrom(token2, owner2, owner1, _amount2);

    }

    function _safeTransferFrom(IERC20 token, address payable sender, address payable recipient, uint amount) private {

        bool sent = token.transferFrom(sender, recipient, amount);
        require (sent, "Token Transfer fail.");
    }

}