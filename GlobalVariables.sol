// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract GobalVariables {

    /*
    global variable
        - 提供區塊鏈或交易的相關訊息
        - 不限制function內外皆可使用
    */

    function globalVars() external view returns (address, uint, uint) {
        address sender = msg.sender;
        uint timestamp = block.timestamp;
        uint blockNum = block.number;
        return (sender, timestamp, blockNum);
    }
}