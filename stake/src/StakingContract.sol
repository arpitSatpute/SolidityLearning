// SPDX-License-Identifier: MIT
pragma solidity version ^0.8.0;

import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";

contract StakingContract  {

    mapping(address => uint256) public balances;
    mapping(address => uint256) public unClaimedRewards;
    mapping(address => uint256) public lastUpdateTime;
    mapping(address => uint256) public rewards;

    constructor() {

    }

    function stake() public payable {
        require(msg.value > 0);
        if(!lastUpdateTime[msg.sender]) {
            lastUpdateTime[msg.sender] = block.timestamp;
        }
        else {
            unclaimedRewards[msg.sender] += (block.timestamp - lastUpdateTime[msg.sender]) * balances[msg.sender];
        }
        balances[msg.sender] += msg.value;
    }

    function unstake(uint256 _amount) public {
        require(balances[msg.sender] >= _amount);
        payable(msg.sender).transfer(_amount);
        balances[msg.sender] -= _amount;
    }

    function claimRewards(address _address) public {
        uint currentReward = unclaimedRewards[_address];
        uint updateTime = lastUpdateTime[_address];
        uint newRewards = (block.timestamp - updateTime) * balances[_address];
        unclaimedRewards[_address] = newRewards;
        lastUpdateTime[_address] = block.timestamp;

    }

    function getRewards(address _address) public view return (uint256) {
        uint currentReward = unclaimedRewards[_address];
        uint updateTime = lastUpdateTime[_address];
        uint newRewards = (block.timestamp - updateTime) * balances[_address];
        return currentRewards + newRewards;

    }

    function getBalance(address _address) public view returns (uint256) {
        return balances[_address];
    }

}