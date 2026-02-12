// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
contract StorageProxy is Ownable {
    uint public num ;
    address implementation ;

    constructor(address _implementation ) Ownable(msg.sender){
        num = 0 ;
        implementation = _implementation;
    }

    function setNum(uint _num) public {
        (bool success ,) = implementation.delegatecall(
            abi.encodeWithSignature("setNum(uint256)", _num )
        );
        require(success , "Something went wrong...");
    }

    function setImplementation(address _implementation ) onlyOwner  public {
        implementation = _implementation ;
    }
}

contract Implementation1{
    address public owner ; 
    uint public num ;
    constructor() {}

    function setNum(uint _num )public {
        num = _num ;
    }
}

contract Implementation2{
    address public owner ;
    uint public num ;
    constructor() {}
    function setNum(uint _num ) public  {
        num = _num * 2 ;
    }
}