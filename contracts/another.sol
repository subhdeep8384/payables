// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;

contract  CallStorage  {
    constructor() {}

    function setNumTo2(address storageContractAddress ) public {
        IStorage(storageContractAddress).setNum(2); 
    }
    function setNumTo3(address storageContractAddress ) public {

    }
}

contract Storage {
    uint public num ;
    constructor() {}

    function setNum(uint _num )public returns (bool)  {
        num = _num ;
        return true ;
    }
}

interface IStorage {
    function setNum(uint ) external   ;
}