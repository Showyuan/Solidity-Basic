// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract VisibilityBase {

    /*
    Visibility
      - public - 所有 contract 和 account 都可以使用
      - private - 只有 contract 內部的 function 可以使用
      - internal- 只有 contract 本身和繼承關係的 contract 可以使用
      - external - 只有其他(除了自己以外的) contracts 和 accounts 可以使用
    */
    uint private x = 0;
    uint internal y = 1;
    uint public z = 2;

    function privateFunc() private pure returns (uint) {
        return 0;
    }

    function internalFunc() internal pure returns (uint) {
        return 100;
    }

    function publicFunc() public pure returns (uint) {
        return 200;
    }

    function externalFunc() external pure returns (uint) {
        return 300;
    }

    function examples() external view {
        x + y + z;

        privateFunc();
        internalFunc();
        publicFunc();

        // 編譯會通過，但不建議使用，這種方式等於再呼叫一次合約來使用externalFunc()，會消耗不必要的gas
        // (X) this.externalFunc(); 

    }
}

contract VisibilityChild is VisibilityBase {
    function examples2() external view {
        y + z;
        internalFunc();
        publicFunc();
    }
}