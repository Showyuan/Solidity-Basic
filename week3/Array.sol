// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Array {
    /*
     Array
      1. 可宣告為動態／固定大小
      2. Array的方法：push(C), get(R), update(U), delete(D), pop, length
      3. 可在memory中新增Array
      4. function可回傳Array
    */

    // 1. 可宣告為動態／固定大小：動態陣列在宣告變數時可不設定size，一旦宣告size後就只能放進固定長度的數值
    uint[] public nums = [1,2,3];
    uint[3] public numFixed = [4,5,6];

    function examples() external {

        // 2. Array的方法：push(C), get(R), update(U), delete(D), pop(取出最後一個值), length(取長度)
        nums.push(4);           // [1, 2, 3, 4]
        uint x = nums[1];       // x = 2
        nums[2] = 777;          // [1, 2, 777, 4]
        delete nums[1];         // [1, 0, 777, 4]
        nums.pop();             // [1, 0, 777]
        uint len = nums.length; // len = 3

        // 3. 可在memory中新增Array: 必須是固定大小，因此無法使用push() & pop()
        uint[] memory a = new uint[](5);
        a[1] = 123;
    }

    // 4. function可回傳Array : 當return Array時，會複製一份Array到memory後回傳，故這種方式會消耗gas(不建議)
    function returnArray() external view returns (uint[] memory) {
        return nums;
    }
}