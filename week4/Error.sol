// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Error {

    /*
    error
      - error 會讓交易回復到執行前的狀態，且 gas 會返還。
      - 可用以下方式拋出 error : require, revert 或 assert。
      - require : 在邏輯執行之前先檢查 inputs 或條件。
      - revert : 邏輯同 require，但如果條件較複雜，需要多層檢查，較適合使用 revert。
      - assert : 檢查一個必須為 true 的條件，如果為 false，表示合約內可能有 bug。
      - custom error : 客製化 error 可節省 gas。
    */

    // require
    function testRequire(uint _i) public pure {
        require(_i <= 10, "i > 10");
        // code
    }

    // revert
    function testRevert(uint _i) public pure {
        if (_i > 1){
            // code
            if (_i > 2){
                // more code
                if (_i > 10) {
                    revert("i > 10");
                }
            }
        }
    }

    // assert
    uint public num = 123;

    function testAssert() public view {
        assert(num == 123);
    }

    // 無論在require、revert、assert前做了什麼操作，只要條件驗證不通過就會被undo
    function foo(uint _i) public {
        num += 1;
        require(_i < 10);
    }

    // custom error
    error MyError(address caller, uint i);

    function testCustomError(uint _i) public view {
        if(_i > 10) {
            revert MyError(msg.sender, _i);  // ex:{"caller": {"value": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4"},"i": {"value": "11"}}
        }
    }

}