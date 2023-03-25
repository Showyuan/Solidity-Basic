// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Constructor {

    /*
    constructor
      - 是一個只在合約新建時，只執行一次的function
      - 主要用於初始化一些變數
    */

    address public owner;
    uint public x;

    constructor(uint _x){
        owner = msg.sender;
        x = _x;
    }
}