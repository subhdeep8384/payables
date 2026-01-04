// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;

contract Money {
    uint public  totalMoney ;
    function deposit() public payable  {
        totalMoney += msg.value ;
    }

    function wihtdrow(address payable  ad ) public  {
       (bool  success , ) = payable(ad).call{value : totalMoney}(""); 
       totalMoney = 0 ;
       require(success , "Eth transfer failed");
    } 
}