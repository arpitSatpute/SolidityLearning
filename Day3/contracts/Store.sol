// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Store{

    uint public num;

    constructor(uint _num) {
        num = _num;
    }

    function getNum() public view returns(uint){
        return num;
    }

    function add() public {
        num = num+1;
    }

}