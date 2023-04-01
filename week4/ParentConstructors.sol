// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

    /*
    calling parent constructors
      - constructor 是一個只在合約新建時，只執行一次的function(非必要)
      - 有兩種方式可以餵入參數來初始化父合約: 詳註解A, B & C
      - constructor 的執行順序由宣告 contract 時的順序決定：詳註解D, E, F & G
    */

contract S {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract T {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// A : 在繼承宣告時，將參數一併宣告
contract U is S("s"),T("t") {

}

// B : 再宣告一個 constructor，以類似 modifiers 的形式傳入參數
contract V is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {

    }
}

// C : 結合A, B 各自傳遞參數
contract VV is S("s"), T {
    constructor(string memory _text) T(_text){

    }
}

// D : execution order : 1. S, 2. T, 3. V0
contract V0 is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {

    }
}

// E : execution order : 1. S, 2. T, 3. V1
contract V1 is S, T {
    constructor(string memory _name, string memory _text) T(_text) S(_name) {

    }
}

// F : execution order : 1. T, 2. S, 3. V2
contract V2 is T, S {
    constructor(string memory _name, string memory _text) T(_text) S(_name) {

    }
}

// G : execution order : 1. T, 2. S, 3. V3
contract V3 is T, S {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {

    }
}