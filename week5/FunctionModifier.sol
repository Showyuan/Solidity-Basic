// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FunctionModifier {

    /*
    Modifier
      - 可以限制存取權限
      - 可以驗證input值是否符合條件
      - 防止重入攻擊
    */

    bool public paused;
    uint public count;

    function setPause(bool _paused) external {
        paused = _paused;
    }

    // 1. Basic 用法
    modifier whenNotPaused() {
        require(!paused, "paused");
        // 驗證完整後，_回到function繼續執行
        _;
    }

    function inc() external whenNotPaused {
        count += 1;
    }

    function dec() external whenNotPaused {
        count -= 1;
    }

    // 2. Input 用法
    modifier cap(uint _x) {
        require(_x < 100, "x >= 100");
        _;
    }

    function incBy(uint _x) external whenNotPaused cap(_x){
        count += _x;
    }

    // 3. Sandwich 用法，假設 count = 0
    modifier sandwich() {
        count += 10; // 1: count = 10
        _;

        count *= 2; // 3: count = 20
    }

    function foo() external sandwich {
        count += 1; // 2: count = 11
    }
}