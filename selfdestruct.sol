// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./Owner.sol";

contract killMe is Ownable{

    function kill () public ownerOnly {
        selfdestruct (payable (msg.sender));
    } 
}
