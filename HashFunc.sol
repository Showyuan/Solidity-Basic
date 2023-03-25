// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract HashFunc {

    /*
    keccak256
      - 用於生成隨機數
    */
    
    function hash(string memory text, uint num, address addr) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text, num, addr));
    }

    // abi.encode : "AAA","BBB" => 0x000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000003414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000034242420000000000000000000000000000000000000000000000000000000000
    function encode(string memory text0, string memory text1) external pure returns (bytes memory) {
        return abi.encode(text0, text1);
    }

    // abi.encodePacked : "AAA","BBB" => 0x414141424242
    function encodePacked(string memory text0, string memory text1) external pure returns (bytes memory) {
        return abi.encodePacked(text0, text1);
    }

    // abi.encodePacked 會將參數按照順序進行連接，不會添加額外的資訊，因此在encodePacked(AAA, BBB)及encodePacked(AA, ABBB)中皆會產生出相同字串，可能會發生Hash collision的問題
    function collision(string memory text0, uint x, string memory text1) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text0, x, text1));
    }
}