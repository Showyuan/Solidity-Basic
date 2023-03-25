// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Enum {

    /*
    Enum
      - 類似於boolean有true/false的選擇，當要客製化更多選擇或狀態時，可使用Enum
      - 可於Contracy外宣告
    */

    enum Status {
        None,     // 0 : default value
        Pending,  // 1
        Shipped,  // 2
        Complete, // 3
        Rejected, // 4
        Canceled  // 5
    }

    Status public status; // default value : None

    // enum 可定義於struct中，作為狀態追蹤選項
    struct Order {
        address buyer;
        Status status;
    }

    Order[] public orders;

    // 取得狀態
    function get() view returns (Status) {
        return status;
    }

    // 設定狀態
    function set(Status _status) external {
        status = _status;
    }

    // 更改狀態為Shipped
    function ship() external {
        status = Status.Shipped;
    }

    // 重設狀態為Default
    function reset() external {
        delete status;
    }
}