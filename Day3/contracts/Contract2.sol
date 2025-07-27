// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IStore{
    function getNum() external view returns(uint);
    function add() external;
}

contract Contract2 {
    
    
    constructor() {

    }

    function proxyAdd() public {
        IStore(0xd9145CCE52D386f254917e481eB44e9943F39138).add();
    }

    function getProxy() public view returns(uint) {
        uint val = IStore(0xd9145CCE52D386f254917e481eB44e9943F39138).getNum();
        return val;
    }  
}