// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract IfElse {

    // if-else 一般的表達方法
    function example(uint _x) external pure returns (uint) {
        If(_x < 10) {
            return 1;
        } else if(_x < 20) {
            return 2;
        } 
        return 3;
    }

    // if-else 三元表達式(更簡潔俐落）
    function ternary(uint _x) public pure returns (uint) {
        // if (_x < 10) {
        //     return 1;
        // }
        // return 2;

        return _x < 10 ? 1 : 2;
    }
}