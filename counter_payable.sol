pragma solidity ^0.5.11;


contract Count {
    
    uint public counter;
    // create an event that takes in an address and uint
    event Transfer(address who, uint amount);
    
    constructor() public {
        counter = 0;
    }
    // function is payable can recieve funds
    function increment() payable external {
        // funds have to be more than 0
        require(msg.value > 0);
        counter++;
    }
    
    function decrement() external {
        counter--;
        // fire off the event with the msg.sender and the balance of this contract
        emit Transfer(msg.sender, address(this).balance);
        // transfer the funds of this contract to the person who called this function
        msg.sender.transfer(address(this).balance);
    }
    // unamed will be called if a transaction is sent here without specifing a function
    function () external {
        counter ++;
    }
    // really here for demo purposes
    function getBalance() view external returns (uint) {
        return address(this).balance;
    } 
}
