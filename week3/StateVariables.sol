// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract StateVariables {

    /*
    state variable
        - 宣告於function外
        - 儲存在區塊鏈中
    */

    uint public myUnit = 123;

    function foo() external {
        uint notStateVariables  = 456;
    }
}