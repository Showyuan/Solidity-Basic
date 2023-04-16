// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Fallback {

    /*
    Fallback
      - 宣告 payable 的 fallback() 主要用於讓合約可以直接接收ETH
      - 當外部呼叫一不存在的 function 時，會進入 fallback()

    */

    event Log(string func ,address sender, uint value, bytes data);

    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value ,msg.data);
    }

    receive() external payable {
        emit Log("receive", msg.sender, msg.value, "");
    }
}