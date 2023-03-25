// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract LocalVariables {

    /*
    local variable
        - 宣告於function內
        - “不”儲存在區塊鏈中
    */

    uint public i;
    bool public b;
    address public myAddress;

    function foo() external {
        // 當function執行結束時，以下變數會消失
        uint x = 123;
        bool f = false;
        x += 456;
        f =  true;

        // 但以下變數因為存在於合約當中，會一直存在
        i = 123;
        b = true;
        myAddress = address(1);
    }
}