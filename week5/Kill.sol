// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Kill {

    /*
    selfdestruct
      - 呼叫 selfdestruct 可以在區塊鏈中刪除合約
      - 會將合約中剩餘的以太幣發送到指定地址
      - *惡意攻擊人士可以透過 selfdestruct 來強制合約把剩餘以太幣發送到指定地址，因此要小心這類的攻擊
    */

    constructor() payable {}

    function kill() external {
        selfdestruct(payable(msg.sender));
    }

    // 在contract Kill被銷毀之後，testCall()就無法再被使用
    function testCall() external pure returns (uint) {
        return 123;
    }
}

contract Helper {
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }

    // 可透過此方式來銷毀另一個contract
    function kill(Kill _kill) external {
        _kill.kill();
    }
}

