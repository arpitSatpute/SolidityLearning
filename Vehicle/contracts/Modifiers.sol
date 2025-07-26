// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Modifires{

    uint num;
    address owner;
    constructor() {
        owner = msg.sender;
    }

    // Custom Modifiers
    modifier onlyOwner() {
        require(owner == msg.sender, "Can be access by owner only");
        _;
    }

    function add(uint _num) public onlyOwner {
        num += _num;
    }

    function subtract(uint _num) public onlyOwner {
        num -= _num;
    }

    // 
}