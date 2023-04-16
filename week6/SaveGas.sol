// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract SaveGas1 {
    uint public someStorageData;

    function foo() public {

        // access memory 會比 access storage 更節省gas
        
        // access storage
        someStorageData;

        // access to memory
        uint someMemoryData = 123;

        uint cach = someStorageData;
    }

}

contract SaveGas2 {
    
    // 當迴圈需要一直讀取state variable時，建議先複製一份到memory再讀取，會更節省gas
    uint public n = 5;

    function noCache() external view returns (uint) {
        uint s = 0;
        for (uint i = 0; i < n; i++) {
            s += 1;
        }

        return s;
    }

    function cache() external view returns (uint) {
        uint s = 0;
        uint _n = n;
        for (uint i = 0; i < _n; i++) {
            s += 1;
        }

        return s;
    }

}