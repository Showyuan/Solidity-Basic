// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Mapping {

    /*
    mapping
      - Map有別於Array找值需要迭代，Map找值不需要透過迴圈，由一組key對應一組value。
      - Map的宣告方式(keyType => valueType)
      - keyType 可以是任何value type, bytes, string or contract.
      - valueType 可以包涵另一個 Map 或 Array
    */

    event test_value(address indexed value1);   
    
    mapping(address => uint) public balances;
    mapping(address => mapping(address => bool)) public isFriend; // NestedMapping

    function examples() external {
        balances[msg.sender] = 123;                 // balances = { "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4" : 123 }
        uint bal = balances[msg.sender];            // bal = 123
        uint bal2 = balances[address(1)];           // 即使address(1)的值沒有被設定過，這行程式碼依然可以運行

        balances[msg.sender] += 456;                // balances = { "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4" : 579 }

        delete balances[msg.sender];                // balances = { "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4" : 0 }

        console.log(address(this));
        isFriend[msg.sender][address(this)] = true; // isFriend = { "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4" : { "0x5e17b14ADd6c386305A32928F985b29bbA34Eff5" : true }}
    }
}