// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;

interface IStorage {
    function add() external ;
    function getNum() external view returns(uint);
}

contract Storage2{
    constructor(){

    }
    function proxyAdd() public {
        IStorage(0xd9145CCE52D386f254917e481eB44e9943F39138).add() ;
    }
    function proxyGet() public view returns (uint){
        uint value =  IStorage(0xd9145CCE52D386f254917e481eB44e9943F39138).getNum() ;
        return value ;
    }
}

