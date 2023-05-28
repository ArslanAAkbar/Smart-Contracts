// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


contract Wallet {
    address[] public owners;
    uint limit;

    modifier ownerOnly() {
        bool owner = false;

        for (uint i=0; i<owners.length; i++) {
            if (owners[i] == msg.sender) {
                owner = true;
            }
        }
        require(owner == true);
        _;
    }

    constructor (address[] memory _owners, uint _limit){

        owners = _owners;
        limit = _limit;
    }

    function deposit() public payable {}

    struct Transfer {

        uint amount;
        address payable receiver;
        uint approvals;
        bool hasBeenSent;
        uint id;
    }

    event transferRequestCreated (uint _id, uint _amount, address _initiator, address _receiver );
    event ApprovalReceived (uint _id, uint _approvals, address _approver);

    Transfer[] transferRequests;

    function createTransection(uint _amount, address payable _receiver) public ownerOnly {
        transferRequests.push(Transfer(_amount, _receiver, 0, false, transferRequests.length));
    }

    mapping(address => mapping( uint => bool)) approvals;

    function approve(uint _id) public ownerOnly {
        require (transferRequests[_id].hasBeenSent == false);
        require (approvals[msg.sender][_id] == false , "You have already approved");

        approvals[msg.sender][_id] = true;
        transferRequests[_id].approvals++;

        if (transferRequests[_id].approvals >= limit) {
            transferRequests[_id].hasBeenSent = true;
            transferRequests[_id].receiver.transfer(transferRequests[_id].amount);
        }
    }

    function getTransferRequest () public view returns (Transfer[] memory) {
        return transferRequests;
    }

}
