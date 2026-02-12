// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol" ;

contract StorageProxy is  Ownable {
    uint public num;
    address implementation;

    event fallbackCalled() ;

    constructor(address _implementation) Ownable(msg.sender) {
        num = 0;
        implementation = _implementation;
    }

    function setNum(uint _num) public {
        (bool success, ) = implementation.delegatecall(
            abi.encodeWithSignature("setNum(uint256)", _num)
        );
        require(success, "Error while delegating call");
    }

    function setImplementation(address _implementation) public onlyOwner {
        implementation = _implementation;
    }

    fallback() external   { 
        emit fallbackCalled() ;
        (bool success , ) = implementation.delegatecall(msg.data) ;
        if(!success ){
            revert();
        }
    }
}

contract Implementationv1 {
    address public owner ;
    uint public num;

    function setNum(uint _num) public {
        num = _num;
    }
}

contract Implementationv2 {
    address public owner ;
    uint public num;

    function setNum(uint _num) public {
        num = _num * 2;
    }
}

contract Implementationv3 {
    address public owner ;
    uint public num;

    function setNum(uint _num) public {
        num = _num * 3;
    }
}
contract Implementationv4 {
    address public owner ;
    uint public num ;
    function setZero() public {
        num = 10000 ;
    }
}
