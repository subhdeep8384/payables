// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Storage {
    uint public num;
    address public implementation;

    constructor(address _implementation) {
        require(_implementation.code.length > 0, "Not a contract");
        implementation = _implementation;
    }

    function setNum(uint _num) public {
        (bool success, ) = implementation.delegatecall(
            abi.encodeWithSignature("setNum(uint256)", _num)
        );
        require(success, "Error while delegating call");
    }
}

contract Implementation {
    uint public num;
    address public implementation; 

    function setNum(uint _num) public {
        num = _num;
    }
}
