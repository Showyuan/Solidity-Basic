// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

    /*
    multi-Inheritance
      - 繼承順序必須從『基礎功能』到『延伸功能』
      - 子合約要覆寫多個父合約的功能時，必須補上 override(X, Y)，X,Y的順序不限
      - 以下範例的繼承關係圖：
            X
          / |
        Y   |
          \ |
            Z
    */

contract X {
    function foo() public pure virtual returns (string memory){
        return "X";
    }

    function bar() public pure virtual returns (string memory) {
        return "X";
    }

    function x() public pure returns (string memory) {
        return "X";
    }
}

contract Y is X {
    function foo() public pure virtual override returns (string memory) {
        return "Y";
    }

    function bar() public pure virtual override returns (string memory) {
        return "Y";
    }

    function y() public pure returns (string memory) {
        return "Y";
    }
}

contract Z is X, Y {
    function foo() public pure override(X, Y) returns (string memory) {
        return "Z";
    }

    function bar() public pure override(Y, X) returns (string memory) {
        return "Z";
    }
}

