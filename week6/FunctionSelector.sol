// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract FunctionSelector {

    /*
    functionSelector
      - function 的完整字串實際上就是 Function Signature
      - Hash 過後取其回傳的 hex 的前 4bytes 給 EVM 便是 Function Selector
      - EVM 透過 4bytes 的 string 辨認要使用哪個 function
    */

    function getSelector(string calldata _func) external pure returns (bytes4) {
        return bytes4(keccak256(bytes(_func)));
    }
}

contract Receiver {
    event Log(bytes data);

    function transfer(address _to, uint _amount) external {
        emit Log(msg.data);
    }
    // getSelector("transfer(address,uint256)") = 0xa9059cbb
    // _to : 0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc
    // _amount : 4000000000000000000000000000000000000000000000000000000000000000b
}
