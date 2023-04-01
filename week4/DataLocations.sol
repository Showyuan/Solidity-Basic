// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract DataLocations {

    /*
    dataLocations
      - storage : state variable，數值儲存於區塊鏈中。
      - memory : 數值只存在於 function 執行期間，執行時底層會複製一份到 memory，function 執行完畢即被釋放。
      - calldatas : 當 function 參數被使用時，參數值直接傳遞，省略了 memory 中複製的動作，calldata只能讀取，不能更改值，比起 memory 更能節省 gas。
      - gas 用量比較 : storage >  memory > calldatas
    */

    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    function examples(uint[] calldata y, string calldata s) external returns (uint[] memory){
        myStructs[msg.sender] = MyStruct({foo : 123, text: "bar"});

        //  storage 會儲存在區塊鏈中
        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "foo";

        //  memory 僅存在function執行期間，function執行完畢後即不能編輯，故建議用來讀取資料
        MyStruct memory readOnly = myStructs[msg.sender];
        readOnly.foo = 456;

        // calldata 傳遞參數，只能用來讀取而不能編輯
        _internal(y);

        uint[] memory memArr = new uint[](3); // [0, 0, 0]
        memArr[0] = 234;                      // [234, 0, 0]
        return memArr;
    }

    function _internal(uint[] calldata y) private {
        uint x = y[0];
    }
}
