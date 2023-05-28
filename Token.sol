// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Token {
    mapping (address => uint ) public balances;
    mapping (address => mapping (address => uint)) public allowance;
    uint public totalSupply = 10000 * 10 ** 18;
    string public name = "My Tokan";
    string public symble = "TKN";
    uint public decimle = 18;
    event Transfered(address indexed from, address indexed to, uint value);
    event Approval ( address indexed owner, address indexed spender, uint value);

    constructor (){
        balances[msg.sender] = totalSupply;
    }

    function balanceof (address owner) public view returns (uint){
        return balances[owner];
    }

    function transfer( address to, uint value) public returns (bool) {
        require ( balances[msg.sender] >= value, "Balance is too low");
        balances[to] += value;
        balances [msg.sender] -= value; 
        emit Transfered (msg.sender, to, value);
        return true;
    }

    function transferTo(address from, address to, uint value) public returns (bool){
        require (balances[from] >= value, "Balance too low");
        require (allowance[from][msg.sender] >= value, "Allowance is too low" );

        balances[to] += value;
        balances[from] -= value;

        emit Transfered (from, to, value);
        return true;
    }

    function approve (address spender, uint value) public returns (bool){
        allowance[msg.sender][spender] = value;
        emit Approval (msg.sender, spender, value);
        return true;
    }
}