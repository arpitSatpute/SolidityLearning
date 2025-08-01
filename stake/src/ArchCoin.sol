// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";

contract ArchCoin is ERC20 {


    address stakingContract;
    address owner;

    constructor(address _stakingContract) ERC20("Arch", "ARCH") {
        stakingContract = _stakingContract;
        owner = msg.sender;
    }

    function mint(address account, uint256 _amount) public  {
        require(msg.sender == stakingContract, "Only staking contract can mint");
        _mint(account, _amount);
    }

    function updateStakingContract(address _stakingContract) public {
        require(msg.sender == owner);
        stakingContract = _stakingContract;
    }

}