pragma solidity ^0.5.11;


contract count {
    
    uint public counter;
    // A struct can hold multiple data types
    struct counting {
        address counter;
        string message; 
    }
    // Array of our structs followed by a mapping
    counting[] public numbers;
    mapping(address => uint) public amount;
    
    constructor() public {
        counter = 0;
    }
    
    function increment(uint _counter, string calldata message) external {
        counter += _counter;
        // push a struct onto our array
        numbers.push(counting(msg.sender, message));
        // put the addresss of the transaction sent and the value they set into mapping
        amount[msg.sender] = _counter;
    }
    
    function decrement() external {
        counter--;
    }
}
