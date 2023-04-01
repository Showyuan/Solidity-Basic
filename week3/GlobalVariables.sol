// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract GlobalVariables {

    /*
    global variable
        - 提供區塊鏈或交易的相關訊息
        - 不限制function內外皆可使用
    */

    function globalVars() external view returns (address, uint, uint) {
        address sender = msg.sender;       // 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
        uint timestamp = block.timestamp;  // 1680006649
        uint blockNum = block.number;      // 4
        return (sender, timestamp, blockNum);
    }
}