// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

    /*
    calling parent functions
      - 呼叫父 function 分為直接呼叫或super方法呼叫：詳註解A & B
      - 以下範例的繼承示意圖：
               E
             /   \
            F     G
             \   /
               H
    */

contract E {
    event Log(string message);

    function foo() public virtual {
        emit Log("E.foo");
    }

    function bar() public virtual {
        emit Log("E.bar");
    }
}

contract F is E {
    function foo() public virtual override {
        emit Log("F.foo");
        // A-1 : 直接呼叫父 function
        E.foo();
    }

    function bar() public virtual override {
        emit Log("F.bar");
        // B-1 : super 方式呼叫父 function
        super.bar();
    }
}

contract G is E {
    function foo() public virtual override {
        emit Log("G.foo");
        E.foo();
    }

    function bar() public virtual override {
        emit Log("G.bar");
        super.bar();
    }
}

contract H is F, G {
    function foo() public override(F, G) {
        // A-2 : 直接呼叫父 function，如果同時繼承多個父合約，直接呼叫F則只會執行F的函數
        // F -> E
        F.foo();
    }

    function bar() public override(F, G) {
        // B-2 : super 方式呼叫父 function，如果同時繼承多個父合約，則所有父合約的函數都會被執行
        // G -> F -> E
        super.bar();
    }
}