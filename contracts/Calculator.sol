// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// contract Sum {
//     uint8 num1 = 10;
//     uint32 bigNum = 10000;
//     int negativeNum = -1000000;
//     address astarPubKey = 0x02CE48EcCF2cf54D380CbFF4ae4eAA74062c02d8;
//     string name = "Astar S";
//     bool isActive = true;

// }

contract Calculator {
    uint num = 0;

    constructor(uint _num) {
        num = _num;
    }

    function add(uint _value) public {
        num += _value;
    }

    function subtract(uint _value) public{
        num -= _value;
    }

    function multiply(uint _value) public{
        num *= _value;
    }

    function divide(uint _value) public{

        require(_value != 0, "Value must not be 0");
        num /= _value;
    }

    function getValue() public view returns(uint) {
        return num;
    }


}

