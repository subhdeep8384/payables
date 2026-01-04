// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0; 

contract Sum {
    uint num ;

    constructor(uint _number ){
        num = _number ;
    }
}
contract Vehicle {
    string brand ;
    constructor(string memory _brand){
        brand = _brand ;
    }
}

contract Car is Vehicle {
    int numberOfDoors ;
    constructor(string memory _brand , int _numberOfDoors) Vehicle(_brand){
        numberOfDoors = _numberOfDoors ;
    }
}

