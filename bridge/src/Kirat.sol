// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { ERC20 } from "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { Ownable } from "../node_modules/@openzeppelin/contracts/access/Ownable.sol";

contract Kirat is ERC20, Ownable {
    

    constructor() ERC20("Kirat", "KIR") Ownable(msg.sender) {
        
    }

    function mint(address _to, uint amount) public isOwner{
        _mint(to, amount);

    }

}