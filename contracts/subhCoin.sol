// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;


contract SubCoin{
    address public  owner ; 
    mapping (address => uint ) balances ;
    mapping (address => mapping (address => uint )) public allowances ;
    uint public totalsupply ;
    modifier  onlyOwner{
        require(msg.sender == owner );
        _;
    }

    modifier onlySpender(address _fromAddress , address _spender , uint _value ){
        require(allowances[_fromAddress][_spender] >= _value );
        _;
    }
    constructor(){
        owner = msg.sender ;
    }


    function mint (uint _amount ) public onlyOwner {
        balances[owner] += _amount ;
        totalsupply += _amount ;
    }

    function mintTo(uint _amount , address _to) public onlyOwner {
        balances[_to] += _amount ;
        totalsupply += _amount ;
    }

    function transferAmount(uint _amount , address _address) public {
        require(balances[msg.sender] >= _amount);
        balances[msg.sender] -= _amount ;
        balances[_address] += _amount ;
    }

    function approve(address _spender , uint _value ) public  returns(bool) {
        allowances[msg.sender][_spender] = _value ;
        return true ;
    }

    function transferFrom(address _fromAddress , uint _value , address _toAdress)public onlySpender(_fromAddress , msg.sender , _value) {
        require(balances[_fromAddress] >= _value , "Insufficient balance");
        balances[_fromAddress] -= _value ;
        balances[_toAdress] += _value ;
        allowances[_fromAddress][msg.sender] -= _value ;
    }
}