// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Constants {

    /*
    constants
        - 不可變的數
        - 通常為大寫命名
        - 可節省gas 成本
    */

    // 356 gas
    address public constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    // uint public constant MY_UNIT = 123;
}

contract Var {
    // 2489 gas
    address public MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
}
