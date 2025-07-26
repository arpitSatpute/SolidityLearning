// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract Vehicle {
    string brand;

    constructor(string memory _brand) {
        brand = _brand;
    }

    function description() public virtual returns (string memory) {
        return "Hi i am a vehicle";
    }

}