// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;

contract Storage {
    uint public num ; 
    address public  implementation ;
    constructor(address _implementation ){
        num = 0 ;
        implementation = _implementation ;
    }

    function setNum(uint _num ) public {
        (bool success , ) = implementation.delegatecall(
            abi.encodeWithSignature("setNum(uint256)",_num)
        ) ;

        require(success , "some error have occured so transaction will be reverted");
    }
    function setNumTo100()public {
        (bool success ,) = implementation.delegatecall(
            abi.encodeWithSignature("setNumTo100()")
        );
        require(success , "some error have occured so transaction will be reverted");
    }
}

contract Implementation {
    uint public num ;
    function setNum(uint _num ) public {
        num = _num ;
    }

    function setNumTo100() public {
        num = 100 ;
    }
}