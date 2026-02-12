// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;


contract CallStorage{
    constructor(){} 
    function setNum2(address _storageContactAddress ) public {
        IStorage(_storageContactAddress).setNum(2);
    }
}

contract Storage {
    uint public number ;
    constructor () {

    }

    function setNum(uint _num) public  {
        number = _num ;
    }
}
interface IStorage {
    function setNum(uint _num )  external ; 
}