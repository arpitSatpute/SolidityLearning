// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Ownable } from "../node_modules/@openzeppelin/contracts/access/Ownable.sol";
import { ERC20 } from "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { IERC20 } from "../node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { console } from "forge-std/console.sol";


interface

contract BridgeETH is Ownable {
    
    uint256 public balance;
    address public tokenAddress;

    mapping(address => uint256) public pendingBalance;

    event Deposit(address indexed depositor, uint amount);

    constructor (address _tokenAddress) Ownable(msg.sender) {
        tokenAddress = _tokenAddress;
    }

    function deposit(IERC20 _tokenAddress, uint256 _amount) public {
        require(address(_tokenAddress) == tokenAddress);
        require(allowance(_tokenAddress.allowance(msg.sender, address(this)) >= _amount, "Insufficient Allowance"));
        require(_tokenAddress.transferFrom(msg.sender, address(this), _amount), "Transfer failed");
        emit Deposit(msg.sender, _amount);
    }

    function withdraw(IERC20 _tokenAddress, uint256 _amount) public {
        require(address(_tokenAddress) == tokenAddress, "Invalid Token Address);
        require(_amount <= pendingBalance[msg.sender], "Insufficient Pending Balance");
        pendingBalance[msg.sender] -= _amount;
        _tokenAddress.transfer(msg.sender, _amount);
    }

    function depositOnOppositeChain(address userAccount, uint256 _amount) public onlyOwner{
        pendingBalance[userAccount] += _amount;

    }

}