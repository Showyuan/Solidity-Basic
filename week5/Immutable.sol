// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Immutable {

    /*
    Immutable
      - 不會再被修改的變數中可宣告 immutable 
      - 此方式可以節省 gas
      - 通常變數名稱可用全大寫命名
    */

    // 不使用 immutable 消耗的gas: 45712
    // 有使用 immutable 消耗的gas: 43579

    address public immutable MY_ADDRESS;

    constructor() {
        MY_ADDRESS = msg.sender;
    }

    uint public x;
    function foo() external {
        require(msg.sender == MY_ADDRESS);
        x += 1;
    }
}