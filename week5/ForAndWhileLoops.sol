// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ForAndWhileLoops {

    /*
    ForLoops and WhileLoops
      - Solidity 迴圈寫法類似於其他程式語言，但要注意迴圈跑得越多次，可能會消耗越多的gas
    */
    function loops() external pure {
        for (uint i = 0; i < 10; i++) {
            if (i == 3) {
                // 跳過這次迴圈，進入下一次迭代
                continue;
            }

            if (i == 5) {
                // 結束迴圈
                break;
            }
        }

        uint j = 0;
        while (j < 10) {
            j++;
        }
    }

    function sum(uint _n) external pure returns (uint) {
        uint s;
        for (uint i = 1; i <= _n; i++) {
            s += i;
        }
        return s;
    }
}