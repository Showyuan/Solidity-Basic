// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

    /*
    inheritance
      - 繼承可以減少重複的程式碼，將共用功能集中管理，再使用繼承來連接父子合約之間的關係
      - 開放給子合約覆寫的 function 必須宣告為 virtual
      - 要覆寫父合約的函數必須使用 override
    */

// contractA : foo() return "A", bar() return "A", baz() return "A"
contract A {
    function foo() public pure virtual returns (string memory){
        return "A";
    }

    function bar() public pure virtual returns (string memory) {
        return "A";
    }

    function baz() public pure returns (string memory) {
        return "A";
    } 
}

// contractB : foo() return "B", bar() return "B", baz() return "A"
contract B is A {
    function foo() public pure override returns (string memory) {
        return "B";
    }

    function bar() public pure virtual override returns (string memory) {
        return "B";
    }

    // 即使 contractB 沒有宣告 function baz()，因繼承關係 contractB 仍可以使用 baz() 的功能
}

// contractC : foo() return "B", bar() return "C", baz() return "A"
contract C is B {
    function bar() public pure override returns (string memory) {
        return "C";
    }

    // 即使 contractC 沒有宣告 function baz() & foo()，因繼承關係 contractC 仍可以使用 baz() & foo() 的功能

}