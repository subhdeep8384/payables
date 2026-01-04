// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;

contract Storage {
    uint public number = 0 ;
    constructor(uint _number){
        number = _number ;
    }   

    function getNum() public view returns(uint) {
        return number ;
    }

    function add() public {
        number = number + 1 ;
    }
}
