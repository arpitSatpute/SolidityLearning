// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Money{

    uint public totalMoney;



    function deposit() public payable {
        totalMoney += msg.value;
    }

    function drain(address payable receiverAddress) public {
        payable(receiverAddress).transfer(totalMoney);
        totalMoney = 0;
    } 


}