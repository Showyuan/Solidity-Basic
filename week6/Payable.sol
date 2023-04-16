// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Payable {

    /*
    Payable
      - 宣告 payable 的 function 可以發送／接收ETH
      - 當呼叫 function 時有包含ETH，而該 function 沒有宣告 payable ，則會顯示錯誤
        (1) 交易的 Data 非空值且 value == 0 的話，Receive or Fallback ? Fallback
        (2) 交易的 Data 是空值且 value != 0 的話，Receive or Fallback ? Receive (如果 Receive 不存在，則進入 Fallback)
        (3) 交易的 Data 是空值且 value == 0 的話，Receive or Fallback ? Receive (如果 Receive 不存在，則進入 Fallback)
        (4) 交易的 Data 非空值且 value != 0 的話，Receive or Fallback ? Fallback
    */

    // 宣告 payable 的 address 才可接收ETH
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function deposit() external {}

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}