// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FunctionIntro {

    /*
    function
      - function可自定義方法的傳入參數、回傳型別
    */

    function add(uint x, uint y) external pure returns (uint) {
        return x + y;
    }

    function sub(uint x, uint y) external pure returns (uint) {
        return x - y;
    }

}