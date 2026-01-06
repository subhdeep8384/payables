// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;


contract SubCoin{
    address public  owner ; 
    mapping (address => uint ) balances ;
    uint public totalsupply ;
    modifier  onlyOwner{
        require(msg.sender == owner );
        _;
    }
    constructor(){
        owner = msg.sender ;
    }


    function mint (uint _amount ) public onlyOwner {
        balances[owner] = _amount ;
        totalsupply += _amount ;
    }

    function mintTo(uint _amount , address _to) public onlyOwner {
        balances[_to] = _amount ;
        totalsupply += _amount ;
    }

    function transferAmount(uint _amount , address _address) public {
        require(balances[msg.sender] >= _amount);
        balances[msg.sender] -= _amount ;
        balances[_address] += _amount ;
    }
}