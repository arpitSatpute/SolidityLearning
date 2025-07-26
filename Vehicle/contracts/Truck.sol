
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
import "./Vehicle.sol";

contract Truck is Vehicle{
    
    uint noOfWheels;
    constructor(string memory _brand, uint _noOfWheels) Vehicle(_brand) {
        noOfWheels = _noOfWheels;
    }

    function description() public pure override  returns (string memory) {
        return "Hi i am a Truck";
    }
    
}