// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FunctionOutputs {

    // 回傳多個值的方式1 : 直接定義參數型別
    function returnMany() public pure returns (uint, bool) {
        return (1,true);
    }

    // 回傳多個值的方式2 : 定義參數型別及參數名稱
    function named() public pure returns (uint x, bool b) {
        return (1,true);
    }

    //  回傳多個值的方式3 : 定義參數型別及參數名稱，並一一指定回傳值，return即可省略
    function assigned() public pure returns (uint x, bool b) {
        x = 1;
        b = true;
    }

    // 接住其他function回傳值的方式
    function destructingAssignments() public pure {
        (uint x, bool b) = returnMany();
        (, bool _b) = returnMany();
    }
}