// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ViewAndPureFunctions {

    /*
    View v.s. Pure
      - View：讀取區塊鏈中的資訊，但不改變值
      - Pure：既不讀取區塊鏈中的資訊，也不改變任何state variable
    */
    uint public num;

    function viewFunc() external view returns (uint) {
        return num;
    }

    function pureFunc() external pure returns (uint) {
        return 1;
    }

    function addToNum(uint x) external view returns (uint) {
        return num + x;
    }

    function add(uint x, uint y) external pure returns (uint) {
        return x + y;
    }
}