// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

    /*
    library
      - library類似於合約，但library不能宣告任何state變數或轉帳(ETH)
      - 當library的functions都是internal時，才會一併被包含在合約內，否則需要先部署後才能被合約使用
    */
library Math {
    function max(uint x, uint y) internal pure returns (uint) {
        return x >= y ? x : y;
    }
}

contract Test {
    function testMax(uint x, uint y) external pure returns (uint) {
        return Math.max(x, y);
    }
}

library ArrayLib {
    function find(uint[] storage arr, uint x) internal view returns (uint) {
        for (uint i = 0; i < arr.length; i++) {
            if (arr[i] == x){
                return i;
            }
        }
        revert("not found");
    }
}

contract TestArray {
    // 可以此方式將 library 引入 array
    using ArrayLib for uint[];
    uint[] public arr = [3, 2, 1];

    function testFind() external view returns (uint i) {
        // array即可直接呼叫 library 中的方法
        return arr.find(2);
    }
}