// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract SendEther {

    /*
    發送 Ether 的三種方式
      - transfer (2300 gas, throws error)，有 2300 gas 的限制，若執行失敗會 revert 
      - send (2300 gas, returns bool)，有 2300 gas 的限制，執行結束回傳 boolean
      - call (forward all gas or set gas, returns bool and data)，無 gas 限制，執行結束回傳 boolean 和 data(bytes)

    */
    constructor() payable {}

    receive() external payable {}

    // gasleft: 2260
    function sendViaTransfer(address payable _to) external payable {
        _to.transfer(123);
    }

    // gasleft: 2260
    function sendViaSend(address payable _to) external payable {
        bool sent = _to.send(123);
        require(sent, "send failed");
    }

    // gasleft: 6521
    function sendViaCall(address payable _to) external payable {
        // call function 會回傳 bool and bytes
        (bool success, ) = _to.call{value: 123}("");
        require(success, "call failed");
    }
}

contract EthReceiver {
    event Log(uint amount, uint gas);

    receive() external payable {
        emit Log(msg.value, gasleft());
    }
}