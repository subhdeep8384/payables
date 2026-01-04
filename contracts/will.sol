// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;


contract Will {
    uint startTime ;
    uint public tenYears ;
    uint public  lastVisited ;
    address owner ;
    address payable recipient ;

    constructor(address payable _recipient ) {
        tenYears = 10 ;
        recipient = _recipient ;
        startTime = block.timestamp ;
        owner = msg.sender ;
        lastVisited = block.timestamp;
    }

    modifier  onlyOwner() {
        require(msg.sender == owner );
        _;
    }
    modifier  onlyReciever(){
        require(msg.sender == recipient);
        _;
    }

    function deposit() public payable  onlyOwner (){
        lastVisited = block.timestamp ;
    }
    function ping() public onlyOwner{
        lastVisited = block.timestamp ;
    }

    function claimMoney() external onlyReciever returns( bool ) {
        require(lastVisited < block.timestamp - tenYears);
        (bool success , )= payable(recipient).call{value : address(this).balance}("eth sended");
        return success ;
    }
}