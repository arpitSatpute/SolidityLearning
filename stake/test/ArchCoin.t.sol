// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "../src/ArchCoin.sol";
import "forge-std/Test.sol";

contract TestContract is Test {
    ArchCoin c;

    function setUp() public {
        c = new ArchCoin(address(this));
    }

    function testInitialSupply() public view {
        assert(c.totalSupply() == 0);
    }
    
}
