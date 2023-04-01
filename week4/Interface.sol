// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

    /*
    interface
      - 用於呼叫另一個合約，而不必擁有它的程式碼 
     - 不能定義任何功能，只能定義 function 名字和參數等等
     - 可以繼承其他 interface
     - 所有宣告的 function 都必須是 external
     - 不能宣告 constructor 和 state variables
    */

interface ICounter {
    function count() external view returns (uint);
    function inc() external;
}

contract CallInterface {
    uint public count;

    function examples(address _counter) external {
        ICounter(_counter).inc();             // count += 1
        count = ICounter(_counter).count();
    }    
}