// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Storage {
    uint public number;
    address public implementation;

    constructor(address _implementation) {
        implementation = _implementation;
    }

    function setNum(uint _num) public {
        (bool success, ) = implementation.delegatecall(
            abi.encodeWithSignature("setNum(uint256)", _num)
        );
        require(success, "delegatecall failed");
    }
}

contract Implementation {
    uint public number;

    function setNum(uint _num) public {
        number = _num;
    }
}
