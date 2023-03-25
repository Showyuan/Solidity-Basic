// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Event {
    

    /*
    event
      - 用於監聽事件，傳遞特定訊息
      - 最多只有3個參數可以被標記為indexed，標記目的主要方便於搜尋
    */
    event Log(string message, uint val);

    event IndexedLog(address indexed sender, uint val);

    function example() external {
        emit Log("foo", 1234);
        emit IndexedLog(msg.sender, 789);
    }

    event Message(address indexed _from, address indexed _to, string message);

    function sendMessage(address _to, string calldata message) external {
        emit Message(msg.sender, _to, message);
    }
}